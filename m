Return-Path: virtio-comment-return-1596-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 11BAC986202
	for <virtio-comment@lists.oasis-open.org>; Fri, 25 Dec 2020 07:38:47 +0000 (UTC)
Date: Fri, 25 Dec 2020 08:38:35 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20201225083835.62efb230.pasic@linux.ibm.com>
In-Reply-To: <3cf88dc9-4053-0f24-854f-6cc6df2aaac4@redhat.com>
References: <20201218042302.8884-1-jasowang@redhat.com>
	<20201221223338.7b5a21e6.pasic@linux.ibm.com>
	<bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
	<20201222075005.69d1cc6e.pasic@linux.ibm.com>
	<ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
	<20201222131404.61e4a136.cohuck@redhat.com>
	<7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
	<20201222165431.3f49de29.cohuck@redhat.com>
	<3cf88dc9-4053-0f24-854f-6cc6df2aaac4@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, 23 Dec 2020 10:48:45 +0800
Jason Wang <jasowang@redhat.com> wrote:
[..]
> >>>>>>> Is it for hardware devices (e.g. PCI) standard to request an
> >>>>>>> operation by writing some value into a register, and get feedback=
 bout
> >>>>>>> a non-completion by reading different value that written, =20
> >>>>>> This is not ununsal in other devices. And in fact, the FEATURES_OK=
 works
> >>>>>> like this:
> >>>>>>
> >>>>>> """
> >>>>>>
> >>>>>> The device MUST NOT offer a feature which requires another feature=
 which
> >>>>>> was not offered. The device SHOULD accept any valid subset of feat=
ures
> >>>>>> the driver accepts, otherwise it MUST fail to set the FEATURES_OK =
device
> >>>>>> status bit when the driver writes it.
> >>>>>>
> >>>>>> """
> >>>>>>       =20
> >>>>> Thanks for the pointer. I intend to have another look at how FEATUR=
ES_OK
> >>>>> works, and how similar this is to DEVICE_STOPPED. =20
> >>>> My understanding is that for both of them, driver can try to set the=
 bit
> >>>> by writing to the status register but it's the device that decide wh=
en
> >>>> to set the bit. =20
> >>> I think there's a difference: For FEATURES_OK, the driver can read ba=
ck
> >>> the status and knows that the feature combination is not accepted if =
it
> >>> is not set. For DEVICE_STOPPED, it does not really know whether the
> >>> device has started to stop yet. It only knows that the device is
> >>> actually done stopping when DEVICE_STOPPED is set. =20
> >>

I share Connie's concern. The config->set_status() is a synchronous API,
that is right after the iowrite8 for pci comes back, or the channel
program finishes executing for ccw, we can go, do a config->get_status()
and know if the status was set succesfully.

> >> The only difference is that device may need sometime to be stopped.
> >> FEATURES_OK might not be the best example. Let's see how reset work
> >> which is more similar to DEVICE_STOPPED:
> >>
> >> """
> >>
> >> After writing 0 to device_status, the driver MUST wait for a read of
> >> device_status to return 0 before reinitializing the device.
> >>
> >> """ =20
> > Hm, but that is PCI-specific writing of fields in the configuration
> > structure, right? CCW uses a different method for resetting (an
> > asynchronous channel command; channel commands create an interrupt when
> > done); "write 0 to status for reset" is not universal. =20
>=20
>=20

> I may miss something. Even if CCW is using something asynchronously (e.g=
=20
> interrupt). It still present a synchronous API to the upper layer. E.g=20
> ccw_io_helper() is using wait_event()?

Right. The reason why we have to wait for the completion of the channel
program is exactly that. Furthermore if we have to fail setting
FEATURES_OK we fail the channel program, that was supposed to do the
operation with an unit check. So at the point where the set_status() is
done, we already know if it worked or not. Of course the device can
change it's status any time.

Since we have a synchronous API setting DEVICE_STOPPED would also have to
block until all in-flight requests are completed. But this does not see
to be what you want. I understood that
virtio_add_status(dev, DEVICE_STOPPED) would return immediately, and so wou=
ld
a subsequent config->get_status(dev) without the DEVICE_STOPPED bit set,
if there are still outstanding requests.

I don't think defining virtio_add_status(dev, FEATURES_OK) (followed by
a readback) as synchronous and virtio_add_status(dev, DEVICE_STOPPED)
(followed by a readback) as asynchronous is a good idea.=20

BTW regarding 'The device SHOULD accept any valid subset of features
the driver accepts, otherwise it MUST fail to set the FEATURES_OK device
status bit when the driver writes it.' I'm a bit puzzled what 'must fail
to set' actually means. From CPU perspective the 'set the FEATURE_OK
status bit' boils down to an instruction generated for iowrite8. As far
as I understand this instruction is not supposed to fail (on s390 there
are multiple ways in which a pci store can fail). AFAIK x86 uses normal
memory access instructions. I suppose when a store instruction does not
fail, then the store must happen. Or is that only true for RAM and for
PCI memory not?


>=20
>=20
> >
> > Which makes me think: is using the device status a good universal
> > method for stopping the device? =20
>=20
>=20
> This part I don't understand. Device stop is kind of similar to reset in=
=20
> this case. If reset can work what prevent stop work?
>=20
> E.g:
>=20
> ccw_io_helper(VIRTIO_CCW_DOING_WRITE_STATUS);
> while (1) {
>  =C2=A0=C2=A0=C2=A0 ccw_io_helper(VIRTIO_CCW_DOING_READ_STATUS);
>  =C2=A0=C2=A0=C2=A0 if (status & DEVICE_STOPPED)
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
> }
>=20

You are right I think. It can work for virtio-ccw, if setting
DEVICE_STOPPED is synchronous. For reset we use the CCW_CMD_VDEV_RESET
ccw command (see in the spec), but that is a design choice. I think
setting the status to 0 via CCW_CMD_WRITE_STATUS should also work. The
code below is from qemu and you should look for the invocation of
virtio_ccw_reset_virtio(). I guess, that is an undocumented feature. And
we can get away with setting the status first, and then doing the reset
here, because the implementation guarantees that the driver won't see
the new status value until the reset is actually done. (This is not
a property of the architecture, but a property of the implementation).

    case CCW_CMD_WRITE_STATUS:
        if (check_len) {
            if (ccw.count !=3D sizeof(status)) {
                ret =3D -EINVAL;
                break;
            }
        } else if (ccw.count < sizeof(status)) {
            /* Can't execute command. */
            ret =3D -EINVAL;=20
            break;
        }
        if (!ccw.cda) {
            ret =3D -EFAULT;
        } else {
            ccw_dstream_read(&sch->cds, status);
            if (!(status & VIRTIO_CONFIG_S_DRIVER_OK)) {
                virtio_ccw_stop_ioeventfd(dev);
            }
            if (virtio_set_status(vdev, status) =3D=3D 0) {
                if (vdev->status =3D=3D 0) {
                    virtio_ccw_reset_virtio(dev, vdev);
                }
                if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
                    virtio_ccw_start_ioeventfd(dev);
                }
                sch->curr_status.scsw.count =3D ccw.count - sizeof(status);
                ret =3D 0;
            } else {
                /* Trigger a command reject. */
                ret =3D -ENOSYS;
            }
        }


>=20
> >   If I look at it only from the CCW
> > perspective, I'd have used a new channel command with a payload of
> > stop/resume and only reflected the stopped state in the device status
> > (i.e. read-only from the driver, and only changed by the device when it
> > transitions to/from the stopped state.) Could PCI use a new field for
> > that? =20
>=20
>=20
> PCI can use new filed. But I wonder how can that help for CCW.

Using a new mechanism to request the device to stop would help with
the synchronous vs asynchronous stuff. I.e. we could keep the FEATURES_OK
synchronous, and make REQUEST_STOP asynchronous.

A new PCI field would have the downside, of being PCI specific. This
feature makes sense to me regardless of the transport. But I don't think
it is likely to become relevant for the ccw any time soon.

Regards,
Halil


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

