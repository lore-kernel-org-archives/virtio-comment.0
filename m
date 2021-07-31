Return-Path: <mst@redhat.com>
Date: Sat, 31 Jul 2021 18:26:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Message-ID: <20210731181746-mutt-send-email-mst@kernel.org>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <87zgu41dt4.fsf@redhat.com>
 <6b01d0aa-005b-06fc-aa07-70f26ed98c4c@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <6b01d0aa-005b-06fc-aa07-70f26ed98c4c@nvidia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Sat, Jul 31, 2021 at 02:34:25PM +0300, Max Gurtovoy wrote:
>=20
> On 7/30/2021 10:05 AM, Cornelia Huck wrote:
> > On Thu, Jul 29 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
> >=20
> > > On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
> > > > On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
> > > > > +\subsubsection{Vendor specific command set}\label{sec:Basic Faci=
lities of a Virtio Device / Admin Virtqueues / Admin command set / Vendor s=
pecific command set}
> > > > > +
> > > > > +The Vendor specific command set is a group of classes and comman=
ds
> > > > > +within each of these classes which are vendor specific. Refer to
> > > > > +each vendor specification for more information on the supported
> > > > > +commands.
> > > > Here's another example.
> > > > It's important that there is a way to make a device completely
> > > > generic without vendor specific expensions.
> > > > Would be hard to do here.
> > > >=20
> > > > That's a generic comment.
> > > >=20
> > > > but specifically I am very reluctant to add vendor specific stuff l=
ike
> > > > this directly in the spec. We already have VIRTIO_PCI_CAP_VENDOR_CFG
> > > > and if that is not sufficient I would like to know why
> > > > before we add more vendor specific stuff.
> > > We are adding an option to add vendor specific commands. We're not
> > > adding it to the spec since each vendor will have its own manual for
> > > that.
> > IMHO, that way madness lies. I want to be able to look at the spec and
> > be able to implement a compliant device or a compliant driver. If a
> > vendor has some special feature they want to support, put it in the
> > spec, so that it is possible to actually implement it.
>=20
> You can implement a compliant device and a compliant. why do you think you
> can't ?
>=20
> Some features are vendor/sub-vendor specific.
>=20
> And as mentioned, you already added it to=A0 the spec so I guess it was f=
or a
> reason.

Well we basically just reserved a capability ID so if people add their
vendor specific ones they don't conflict with each other or capabilities
we'll add in the future.
And such a capability can prove useful for things like
identifying the device to enable workarounds, etc.

That is a far cry from a fat interface which generic drivers will need to
support and who's sole purpose is vendor specific extensions.

And yes, it also allows you to unload the generic driver and load
a vendor driver. Which can then go wild if it wants to - nothing
we can or want to do about it.


> If someone would like to add its special souse to virtio device and we ha=
ve
> a flexible admin queue to manage it with a spec compliant manner, why not=
 ?
>
> The feature might not get support by the working group so do you really w=
ant
> to limit vendor from implementing features that are not agreed here on the
> mailing list ?
>=20
> Adding a vendor specific command set is trivial.

Supporting all this mess leter isn't. So we better make sure just how
is all this vendor stuff going to be limited.

> >=20
> > > For example, we can use virtio-cli to pass command from command line =
to
> > > device in pass-through manner without changing driver.
> > Things like that are part of the driver as in the spec sense. The spec
> > does not care how you actually split the implementation, or what
> > controls you are giving to whom. We need a defined interface.
>=20
> We have an interface. Its the admin queue.
>=20
> Virtio-cli will be a user space tool to send commands via this admin queue
> and configure the device.
>=20
> The driver will just open a char dev to supply a channel to this admin qu=
eue
> from user space.
>=20
> Examples:
>=20
> 1. format a virtio-blk device to add data integrity checks (T-10)
>=20
> 2. set 5 msix to VF_1, 12 msix to VF_2 and 2 msix to VF_3 before enabling
> SRIOV
>=20
> 3. Get telemetry log
>=20
> 4. Get error log
>=20
> 5. Get vendor specific HW health report
>=20
> 6. Get generic virtio device health report
>=20
> 7. set 5 queues to VF_1, 12 queues to VF_2 and 2 queues to VF_3 before
> enabling SRIOV
>=20
>=20
> This knowledge is needed for the sys-admin and not the driver. The driver
> will provide the channel to enable this configuration by an
> orchestrator/admin.
>=20
>=20
>=20
> >=20

