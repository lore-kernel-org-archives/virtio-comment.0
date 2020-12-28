Return-Path: virtio-comment-return-1600-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C416798630D
	for <virtio-comment@lists.oasis-open.org>; Mon, 28 Dec 2020 06:47:37 +0000 (UTC)
References: <20201218042302.8884-1-jasowang@redhat.com>
 <20201221223338.7b5a21e6.pasic@linux.ibm.com>
 <bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
 <20201222075005.69d1cc6e.pasic@linux.ibm.com>
 <ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
 <20201222131404.61e4a136.cohuck@redhat.com>
 <7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
 <20201222165431.3f49de29.cohuck@redhat.com>
 <3cf88dc9-4053-0f24-854f-6cc6df2aaac4@redhat.com>
 <20201225083835.62efb230.pasic@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ae55616a-ceb0-3868-933b-d93a73d717be@redhat.com>
Date: Mon, 28 Dec 2020 14:47:21 +0800
MIME-Version: 1.0
In-Reply-To: <20201225083835.62efb230.pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/12/25 =E4=B8=8B=E5=8D=883:38, Halil Pasic wrote:
> On Wed, 23 Dec 2020 10:48:45 +0800
> Jason Wang <jasowang@redhat.com> wrote:
> [..]
>>>>>>>>> Is it for hardware devices (e.g. PCI) standard to request an
>>>>>>>>> operation by writing some value into a register, and get feedback=
 bout
>>>>>>>>> a non-completion by reading different value that written,
>>>>>>>> This is not ununsal in other devices. And in fact, the FEATURES_OK=
 works
>>>>>>>> like this:
>>>>>>>>
>>>>>>>> """
>>>>>>>>
>>>>>>>> The device MUST NOT offer a feature which requires another feature=
 which
>>>>>>>> was not offered. The device SHOULD accept any valid subset of feat=
ures
>>>>>>>> the driver accepts, otherwise it MUST fail to set the FEATURES_OK =
device
>>>>>>>> status bit when the driver writes it.
>>>>>>>>
>>>>>>>> """
>>>>>>>>        =20
>>>>>>> Thanks for the pointer. I intend to have another look at how FEATUR=
ES_OK
>>>>>>> works, and how similar this is to DEVICE_STOPPED.
>>>>>> My understanding is that for both of them, driver can try to set the=
 bit
>>>>>> by writing to the status register but it's the device that decide wh=
en
>>>>>> to set the bit.
>>>>> I think there's a difference: For FEATURES_OK, the driver can read ba=
ck
>>>>> the status and knows that the feature combination is not accepted if =
it
>>>>> is not set. For DEVICE_STOPPED, it does not really know whether the
>>>>> device has started to stop yet. It only knows that the device is
>>>>> actually done stopping when DEVICE_STOPPED is set.
> I share Connie's concern. The config->set_status() is a synchronous API,
> that is right after the iowrite8 for pci comes back, or the channel
> program finishes executing for ccw, we can go, do a config->get_status()
> and know if the status was set succesfully.
>
>>>> The only difference is that device may need sometime to be stopped.
>>>> FEATURES_OK might not be the best example. Let's see how reset work
>>>> which is more similar to DEVICE_STOPPED:
>>>>
>>>> """
>>>>
>>>> After writing 0 to device_status, the driver MUST wait for a read of
>>>> device_status to return 0 before reinitializing the device.
>>>>
>>>> """
>>> Hm, but that is PCI-specific writing of fields in the configuration
>>> structure, right? CCW uses a different method for resetting (an
>>> asynchronous channel command; channel commands create an interrupt when
>>> done); "write 0 to status for reset" is not universal.
>>
>> I may miss something. Even if CCW is using something asynchronously (e.g
>> interrupt). It still present a synchronous API to the upper layer. E.g
>> ccw_io_helper() is using wait_event()?
> Right. The reason why we have to wait for the completion of the channel
> program is exactly that. Furthermore if we have to fail setting
> FEATURES_OK we fail the channel program, that was supposed to do the
> operation with an unit check. So at the point where the set_status() is
> done, we already know if it worked or not.


The only difference is, for FEATURES_OK, driver know it won't work any=20
more. But for DEVICE_STOPPED, driver know it might work sometime in the=20
future.


> Of course the device can
> change it's status any time.
>
> Since we have a synchronous API setting DEVICE_STOPPED would also have to
> block until all in-flight requests are completed. But this does not see
> to be what you want. I understood that
> virtio_add_status(dev, DEVICE_STOPPED) would return immediately, and so w=
ould
> a subsequent config->get_status(dev) without the DEVICE_STOPPED bit set,
> if there are still outstanding requests.


Yes.


>
> I don't think defining virtio_add_status(dev, FEATURES_OK) (followed by
> a readback) as synchronous and virtio_add_status(dev, DEVICE_STOPPED)
> (followed by a readback) as asynchronous is a good idea.


The main reason is that DEVICE_STOPPED is a one of the possible state.=20
We'd better do this by extending the current device status state=20
machine. Otherwise it would be more complicated (e.g using another=20
interface).

It looks to me what you don't like is the driver API design? If yes, how=20
about introduce something like virtio_try_add_status()? The difference=20
is that it doesn't=C2=A0 require a immediate result.


>
> BTW regarding 'The device SHOULD accept any valid subset of features
> the driver accepts, otherwise it MUST fail to set the FEATURES_OK device
> status bit when the driver writes it.' I'm a bit puzzled what 'must fail
> to set' actually means.


Good point, my understanding for "set XX bit" means the whether or not=20
the bit could be read by the driver. We need some clarification here.


>   From CPU perspective the 'set the FEATURE_OK
> status bit' boils down to an instruction generated for iowrite8. As far
> as I understand this instruction is not supposed to fail (on s390 there
> are multiple ways in which a pci store can fail).


Yes, my understanding is that it doesn't mean fail the instruction. As=20
you said it's sometime impossible a specific transport.


>   AFAIK x86 uses normal
> memory access instructions. I suppose when a store instruction does not
> fail, then the store must happen. Or is that only true for RAM and for
> PCI memory not?


AFAIK, PCI have non-posted write which can fail but the spec doesn't=20
requires that.


>
>
>>
>>> Which makes me think: is using the device status a good universal
>>> method for stopping the device?
>>
>> This part I don't understand. Device stop is kind of similar to reset in
>> this case. If reset can work what prevent stop work?
>>
>> E.g:
>>
>> ccw_io_helper(VIRTIO_CCW_DOING_WRITE_STATUS);
>> while (1) {
>>   =C2=A0=C2=A0=C2=A0 ccw_io_helper(VIRTIO_CCW_DOING_READ_STATUS);
>>   =C2=A0=C2=A0=C2=A0 if (status & DEVICE_STOPPED)
>>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
>> }
>>
> You are right I think. It can work for virtio-ccw, if setting
> DEVICE_STOPPED is synchronous. For reset we use the CCW_CMD_VDEV_RESET
> ccw command (see in the spec), but that is a design choice. I think
> setting the status to 0 via CCW_CMD_WRITE_STATUS should also work. The
> code below is from qemu and you should look for the invocation of
> virtio_ccw_reset_virtio(). I guess, that is an undocumented feature.


Then I think it needs to be clarified in the spec.


>   And
> we can get away with setting the status first, and then doing the reset
> here, because the implementation guarantees that the driver won't see
> the new status value until the reset is actually done. (This is not
> a property of the architecture, but a property of the implementation).


So did PCI:

 =C2=A0=C2=A0=C2=A0 case VIRTIO_PCI_STATUS:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(val & VIRTIO_CONFIG_S_DRI=
VER_OK)) {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtio_=
pci_stop_ioeventfd(proxy);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtio_set_status(vdev, val & 0=
xFF);

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (val & VIRTIO_CONFIG_S_DRIVE=
R_OK) {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtio_=
pci_start_ioeventfd(proxy);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vdev->status =3D=3D 0) {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtio_=
pci_reset(DEVICE(proxy));
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

As you said, it's a implementation property since qemu implements a=20
synchronous virtio_set_status(). But it might not be true for real=20
hardware which may require more time or even hard to drain a queue in=20
short time. That's why PCI spec mandate the driver to poll for the=20
status after writing zero to device status.


>
>      case CCW_CMD_WRITE_STATUS:
>          if (check_len) {
>              if (ccw.count !=3D sizeof(status)) {
>                  ret =3D -EINVAL;
>                  break;
>              }
>          } else if (ccw.count < sizeof(status)) {
>              /* Can't execute command. */
>              ret =3D -EINVAL;
>              break;
>          }
>          if (!ccw.cda) {
>              ret =3D -EFAULT;
>          } else {
>              ccw_dstream_read(&sch->cds, status);
>              if (!(status & VIRTIO_CONFIG_S_DRIVER_OK)) {
>                  virtio_ccw_stop_ioeventfd(dev);
>              }
>              if (virtio_set_status(vdev, status) =3D=3D 0) {
>                  if (vdev->status =3D=3D 0) {
>                      virtio_ccw_reset_virtio(dev, vdev);
>                  }
>                  if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
>                      virtio_ccw_start_ioeventfd(dev);
>                  }
>                  sch->curr_status.scsw.count =3D ccw.count - sizeof(statu=
s);
>                  ret =3D 0;
>              } else {
>                  /* Trigger a command reject. */
>                  ret =3D -ENOSYS;
>              }
>          }
>
>
>>>    If I look at it only from the CCW
>>> perspective, I'd have used a new channel command with a payload of
>>> stop/resume and only reflected the stopped state in the device status
>>> (i.e. read-only from the driver, and only changed by the device when it
>>> transitions to/from the stopped state.) Could PCI use a new field for
>>> that?
>>
>> PCI can use new filed. But I wonder how can that help for CCW.
> Using a new mechanism to request the device to stop would help with
> the synchronous vs asynchronous stuff. I.e. we could keep the FEATURES_OK
> synchronous, and make REQUEST_STOP asynchronous.


Right, but as said before, it looks more like a part of device status=20
state machine, using new mechanism might bring extra complexity and=20
confusion.

Looking at CCW implementation of device status, I don't see any blocker=20
for implementing it synchronously if we just wait for the stop of the=20
device and then return?


>
> A new PCI field would have the downside, of being PCI specific. This
> feature makes sense to me regardless of the transport. But I don't think
> it is likely to become relevant for the ccw any time soon.


Yes, it's better not limit the feature to a specific transport.

Thanks


>
> Regards,
> Halil
>


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

