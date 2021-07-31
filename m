Return-Path: <mst@redhat.com>
Date: Sat, 31 Jul 2021 18:17:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Message-ID: <20210731175617-mutt-send-email-mst@kernel.org>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <20210730032625-mutt-send-email-mst@kernel.org>
 <0bffb13f-4e88-266d-e072-bafa44ec86fe@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <0bffb13f-4e88-266d-e072-bafa44ec86fe@nvidia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, cohuck@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Sat, Jul 31, 2021 at 02:53:45PM +0300, Max Gurtovoy wrote:
>=20
> On 7/30/2021 10:36 AM, Michael S. Tsirkin wrote:
> > On Thu, Jul 29, 2021 at 05:51:07PM +0300, Max Gurtovoy wrote:
> > > On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
> > > > On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
> > > > > Admin virtqueues will be used to send administrative commands to
> > > > > manipulate various features of the device which would not easily =
map
> > > > > into the configuration space.
> > > > >=20
> > > > > The same Admin command format will be used for all virtio devices=
. The
> > > > > Admin command set will include 4 types of command classes:
> > > > > 1. The generic common class
> > > > > 2. The transport specific class
> > > > > 3. The device specific class
> > > > > 4. The vendor specific class
> > > > >=20
> > > > > The above mechanism will enable adding various features to the vi=
rtio
> > > > > specification, e.g.:
> > > > > 1. Format virtio-blk devices in various configurations (512B bloc=
k size,
> > > > >      512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc..).
> > > > > 2. Live migration management.
> > > > > 3. Encrypt/Decrypt descriptors.
> > > > > 4. Virtualization management.
> > > > > 5. Get device error logs.
> > > > > 6. Implement advanced vendor/device/transport specific features.
> > > > > 7. Run device health test.
> > > > > 8. More.

I still don't really see what do all these things have in common?
Why are they grouped behind the same feature bit? Share same VQ?

> > > > >=20
> > > > > As virtio evolves beyond the para-virt/sw-emulated world, it's ma=
ndatory
> > > > > for the specification to become flexible and allow a wider featur=
e set.
> > > > > The corrent ctrl virtq that is defined for some of the virtio dev=
ices is
> > > > > device specific and wasn't designed to be a generic virtq for
> > > > > admininistration.
> > > > >=20
> > > > > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > > > Lots of things on this list seem to make sense when
> > > > done from PF and affecting a VF.
> > > > I think from this POV the generic structure should include
> > > > a way to address one device from another.
> > > This will be defined per command.
> > >=20
> > > For example, funcion_id will be given as command data.
> > Why? Sounds like a generic thing to me.
>=20
> Generic to a command that handles virtualization management.


It could be that mixing up virtualization management and arbitrary
other management commands in the same interface is a mistake.
Or maybe not - do we want host to have ability to run health tests
for a VF without loading VF driver? Get error logs?


In fact besides migration and virtualization management the rest of
examples that you give all seem to be more or less device specific, with
the possible exception of 3. Encrypt/Decrypt descriptors.  what does
this one imply, exactly?



> It has nothing to do with a discovery command for the device itself.
>=20
> I guess we can add few bytes to be mandatory after the <u8 class, u8
> command> pair.
>=20
> Something like <u8 class, u8 command, u16 mandatory_command_data >.
>=20
> But I think it's not a must and it's already covered by:=A0 "u8
> command-specific-data[];"

I would say we should include the device ID as well as a definition
what the ID is at least for SRIOV. This isn't a command
specific data, any virt management command will need this.


>=20
> >=20
> >=20
> > > > > ---
> > > > >    admin-virtq.tex | 241 ++++++++++++++++++++++++++++++++++++++++=
++++++++
> > > > >    content.tex     |   4 +
> > > > >    2 files changed, 245 insertions(+)
> > > > >    create mode 100644 admin-virtq.tex
> > > > >=20
> > > > > diff --git a/admin-virtq.tex b/admin-virtq.tex
> > > > > new file mode 100644
> > > > > index 0000000..ccec2ca
> > > > > --- /dev/null
> > > > > +++ b/admin-virtq.tex
> > > > > @@ -0,0 +1,241 @@
> > > > > +\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virti=
o Device / Admin Virtqueues}
> > > > > +
> > > > > +Admin virtqueues are used to send administrative commands to man=
ipulate
> > > > > +various features of the device which would not easily map into t=
he
> > > > > +configuration space.
> > > > > +
> > > > > +Use of Admin virtqueues is negotiated by the VIRTIO_F_ADMIN_VQ
> > > > > +feature bit.
> > > > > +
> > > > > +Admin virtqueue index may vary among different device types.
> > > > > +
> > > > > +All commands are of the following form:
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_admin_cmd {
> > > > > +        /* Device-readable part */
> > > > > +        u8 class;
> > > > > +        u8 command;
> > > > > +        u8 command-specific-data[];
> > > > > +
> > > > > +        /* Device-writable part */
> > > > > +        u8 command-specific-result[];
> > > > > +        u8 status_type : 4;
> > > > > +        u8 reserved : 4;
> > > > > +        u8 status;
> > > > > +};
> > > > > +
> > > > > +/* Status type values */
> > > > > +#define VIRTIO_ADMIN_STATUS_TYPE_GENERIC               0
> > > > > +#define VIRTIO_ADMIN_STATUS_TYPE_CLASS_SPECIFIC        1
> > > > > +#define VIRTIO_ADMIN_STATUS_TYPE_COMMAND_SPECIFIC      2
> > > > > +#define VIRTIO_ADMIN_STATUS_TYPE_TRANSPORT_SPECIFIC    3
> > > > > +#define VIRTIO_ADMIN_STATUS_TYPE_DEVICE_SPECIFIC       4
> > > > > +#define VIRTIO_ADMIN_STATUS_TYPE_VENDOR_SPECIFIC       5
> > > > > +
> > > > > +/* Generic status values */
> > > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_OK                     0
> > > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_ERR                    1
> > > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_CLASS          2
> > > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_COMMAND        3
> > > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_DATA_TRANSFER_ERR      4
> > > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_DEVICE_INTERNAL_ERR    5
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +The \field{class}, \field{command} and \field{command-specific-d=
ata} are
> > > > > +set by the driver, and the device sets the \field{status_type}, =
the
> > > > > +\field{status} and  the \field{command-specific-result}, if need=
ed.
> > > > > +
> > > > > +The virtio Admin command class codes are divided in the followin=
g form:
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +/* class values that are transport, device and vendor independen=
t */
> > > > > +#define VIRTIO_ADMIN_COMMON_CLASS_START    0
> > > > > +#define VIRTIO_ADMIN_COMMON_CLASS_END      63
> > > > > +
> > > > > +/* class values that are transport specific */
> > > > > +#define VIRTIO_ADMIN_TRANSPORT_CLASS_START  64
> > > > > +#define VIRTIO_ADMIN_TRANSPORT_CLASS_END    127
> > > > > +
> > > > > +/* class values that are device specific */
> > > > > +#define VIRTIO_ADMIN_DEVICE_CLASS_START     128
> > > > > +#define VIRTIO_ADMIN_DEVICE_CLASS_END       191
> > > > > +
> > > > > +/* class values that are vendor specific */
> > > > > +#define VIRTIO_ADMIN_VENDOR_CLASS_START     192
> > > > > +#define VIRTIO_ADMIN_VENDOR_CLASS_END       255
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\subsection{Admin command set}\label{sec:Basic Facilities of a V=
irtio Device / Admin Virtqueues / Admin command set}
> > > > > +
> > > > > +Each virtio device that advertise VIRTIO_F_ADMIN_VQ feature, MUST
> > > > > +support all the mandatory admin commands. A device MAY support a=
lso
> > > > > +one or more optional admin commands.
> > > > > +
> > > > > +\subsubsection{Common command set}\label{sec:Basic Facilities of=
 a Virtio Device / Admin Virtqueues / Admin command set / Common command se=
t}
> > > > > +
> > > > > +The Common command set is a group of classes and commands within=
 each
> > > > > +of these classes which are transport, device and vendor independ=
ent.
> > > > > +A mandatory class is a class that has at least one mandatory com=
mand.
> > > > > +The Common command set is summarized in following table:
> > > > > +
> > > > > +\begin{tabular}{|l|l|l|}
> > > > > +\hline
> > > > > +Class  & Description    & M/O \\
> > > > > +\hline \hline
> > > > > +0  & VIRTIO_ADMIN_DISCOVER_DEVICE    & M \\
> > > > > +\hline
> > > > > +1  & VIRTIO_ADMIN_DISCOVER_DEVICE_CLASS_COMMANDS    & M \\
> > > > > +\hline
> > > > > +2-63  & reserved    & - \\
> > > > > +\hline
> > > > > +\end{tabular}
> > > > > +
> > > > > +\paragraph{Discover device class}\label{sec:Basic Facilities of =
a Virtio Device / Admin Virtqueues / Admin command set / Common command set=
 / Discover device class}
> > > > > +
> > > > > +This class (opcode: 0) of commands is used to query generic devi=
ce
> > > > > +information. The following table describes the commands supporte=
d for
> > > > > +this class:
> > > > > +
> > > > > +\begin{tabular}{|l|l|l|}
> > > > > +\hline
> > > > > +Command  & Description    & M/O \\
> > > > > +\hline \hline
> > > > > +0  & VIRTIO_ADMIN_DISCOVER_DEVICE_IDENTITY    & M \\
> > > > > +\hline
> > > > > +1  & VIRTIO_ADMIN_DISCOVER_DEVICE_SUPPORTED_CLASSES    & M \\
> > > > > +\hline
> > > > > +2-255  & reserved    & - \\
> > > > > +\hline
> > > > > +\end{tabular}
> > > > So there are several problems with this approach.
> > > > One is that there is no two way negotiation.
> > > you negotiate the adminq feature.
> > >=20
> > > then you can send admin commands and discover the supported commands.
> > >=20
> > > > No way for device to know what will driver use in the end.
> > > device will be designed to support mandatory admin commands and some
> > > optional.
> > >=20
> > > It doesn't need to care whether the driver will use it or not.
> > > > This breaks things like e.g. accelerating some configurations
> > > > but not others.
> > > I don't understand what it breaks exactly.
> > Long practice taught us that it is good for device to know
> > what is driver going to use.
> > For example, some features can be implemented in hardware
> > and some in hypervisor software. If driver is going to use software
> > features then you need to switch to a slower software
> > implementation. Doing that dynamically at time of use is
> > often much harder that up-front at negotiation time.
>=20
> I don't think we should write specifications that should consider hypervi=
sor
> SW.

Well considering hypervisors is clearly one of the purposes of virtio TC.
Look it up in the charter, section 2. Statement of Purpose.


> You might use virtio device without hypervisor at all.

Yes and supporting that is also clearly an objective:

	With the 1.1, 1.2 and future revisions of the Specification, we aim to
	evolve the VIRTIO standard further, addressing such new requirements
	while both continuing to honor the goals of the 1.0 Specification and
	including new objectives.




>=20
> >=20
> > > > Another is that everything is going through the admin vq.
> > > > Hard for hypervisor to intervene and change just some aspects
> > > > of the device.
> > > we'll develop virtio-cli tool.
> > will that be part of the spec somehow then?
> > I'm not sure it can be ...
>=20
> of course not.
>=20
> This is just a channel for the admin to send admin command to the virtio
> device.
>=20
> >=20
> > > I don't know what should be changed in the device by the hypervisor.
> > Look at vdpa as an example, guest device can be different from
> > host device.
>=20
> VDPA is an acceleration. I can write different acceleration on to of virt=
io
> device.
>=20
> Is shouldn't be considered in the specification.
>=20
> Nevertheless, there is nothing in this RFC that VDPA can't handle.
>=20
>=20
> >=20
> > > > This is also a problem for validation, tricky
> > > > to find out during probe what does device support and whether
> > > > driver can work with it.
> > > device will support admin q with mandatory commands.
> > >=20
> > > Old driver shouldn't care and it won't negotiate this feature.
> > >=20
> > > New drivers will adjust and will be extended.
> > Does not sound like I got the issue across.
> >=20
> > Operating VQs just to know whether to bind to device is
> > problematic since there's an assumption that once
> > DRIVER_OK is set driver is happy. Before DRIVER_OK
> > device will not consume buffers.
>=20
> Nothing is changed in DRIVER_OK negotiation rules.

Right and that means you can't really use the admin vq to validate
device during driver probe.


> >=20
> >=20
> > > >=20
> > > > Can't we map this stuff into memory instead?
> > > > Maybe have an admin config structure
> > > > that is separate from regular config?
> > > > Only issue we can't then make it too big.
> > > > But so far I don't see a lot of info used, most is reserved.
> > > This is initial commit to add infrastructure. I can't add 255 command=
s at
> > > once.
> > >=20
> > > We need to add it incrementally.
> > How about a list of future extensions?
>=20
> Added a partial list in the commit message and in the answer to Cornelia.
>=20
>=20
> >=20
> >=20
> > > >=20
> > > >=20
> > > > > +
> > > > > +\subparagraph{Device identity command}\label{sec:Basic Facilitie=
s of a Virtio Device / Admin Virtqueues / Admin command set / Common comman=
d set / Discover device class / Device identity command}
> > > > > +
> > > > > +This mandatory command should return device identity in the foll=
owing
> > > > > +structure:
> > > > > +
> > > > > +\begin{tabular}{|l|l|l|}
> > > > > +\hline
> > > > > +Bytes  & Description    & M/O \\
> > > > > +\hline \hline
> > > > > +03:00  & VIRTIO DEVICE ID    & M \\
> > > > > +\hline
> > > > > +05:04  & VIRTIO TRANSPORT ID    & M \\
> > > > > +\hline
> > > > > +4095:06  & reserved    & - \\
> > > > > + \hline
> > > > > +\end{tabular}
> > > > > +
> > > > > +\subparagraph{Device supported classes command}\label{sec:Basic =
Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Comm=
on command set / Discover device class / Device supported classes command}
> > > > > +
> > > > > +This mandatory command should return device identity in the foll=
owing
> > > > > +structure:
> > > > > +
> > > > > +\begin{tabular}{|l|l|l|}
> > > > > +\hline
> > > > > +Bytes  & Description    & M/O \\
> > > > > +\hline \hline
> > > > > +03:00  & VIRTIO_ADMIN_CLASS_0_PROPERTIES    & M \\
> > > > > +\hline
> > > > > +07:04  & VIRTIO_ADMIN_CLASS_1_PROPERTIES    & M \\
> > > > > + \hline
> > > > > +11:08  & VIRTIO_ADMIN_CLASS_2_PROPERTIES    & M \\
> > > > > +\hline
> > > > > +...  & ...    & M \\
> > > > > +\hline
> > > > > +1023:1020  & VIRTIO_ADMIN_CLASS_255_PROPERTIES    & M \\
> > > > > +\hline
> > > > > +4095:1024  & reserved    & - \\
> > > > > +\hline
> > > > > +\end{tabular}
> > > > > +
> > > > > +The above structure is divided to 256 sections of 4B each, that =
will
> > > > > +describe whether a device supports a certain class code. The
> > > > > +following 3072B are reserved. each of the non-reserved 4B sectio=
ns will
> > > > > +follow the following data structure:
> > > > > +
> > > > > +\begin{tabular}{|l|l|l|}
> > > > > +\hline
> > > > > +Bits  & Description    & M/O \\
> > > > > +\hline \hline
> > > > > +0  & SUPPORTED (1: yes, 0:no)    & M \\
> > > > > +\hline
> > > > > +31:01  & reserved    & - \\
> > > > > + \hline
> > > > > +\end{tabular}
> > > > > +
> > > > > +\paragraph{Discover device class commands class}\label{sec:Basic=
 Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Com=
mon command set / Discover device class commands class}
> > > > > +
> > > > > +This class (opcode: 1) of commands is used to query supported co=
mmands
> > > > > +for each supported device class.
> > > > > The following table describes the commands
> > > > > +supported for this class:
> > > > > +
> > > > > +\begin{tabular}{|l|l|l|}
> > > > > +\hline
> > > > > +Command  & Description    & M/O \\
> > > > > +\hline \hline
> > > > > +0  & VIRTIO_ADMIN_CLASS_0_COMMANDS_IDENTITY    & M \\
> > > > > +\hline
> > > > > +1  & VIRTIO_ADMIN_CLASS_1_COMMANDS_IDENTITY    & M \\
> > > > > +\hline
> > > > > +2  & VIRTIO_ADMIN_CLASS_2_COMMANDS_IDENTITY    & M \\
> > > > > +\hline
> > > > > +...  & ...    & M \\
> > > > > +\hline
> > > > > +255  & VIRTIO_ADMIN_CLASS_255_COMMANDS_IDENTITY    & M \\
> > > > > +\hline
> > > > > +\end{tabular}
> > > > > +
> > > > > +Each command in this class, will return class identity in the fo=
llowing structure:
> > > > > +
> > > > > +\begin{tabular}{|l|l|l|}
> > > > > +\hline
> > > > > +Bytes  & Description    & M/O \\
> > > > > +\hline \hline
> > > > > +03:00  & VIRTIO_ADMIN_COMMAND_0_PROPERTIES    & M \\
> > > > > +\hline
> > > > > +07:04  & VIRTIO_ADMIN_COMMAND_1_PROPERTIES    & M \\
> > > > > + \hline
> > > > > +11:08  & VIRTIO_ADMIN_COMMAND_2_PROPERTIES    & M \\
> > > > > +\hline
> > > > > +...  & ...    & M \\
> > > > > +\hline
> > > > > +1023:1020  & VIRTIO_ADMIN_COMMAND_255_PROPERTIES    & M \\
> > > > > +\hline
> > > > > +4095:1024  & reserved    & - \\
> > > > > +\hline
> > > > > +\end{tabular}
> > > > > +
> > > > > +The above structure is divided to 256 sections of 4B each, that =
will
> > > > > +describe whether a class supports a certain command code. The
> > > > > +following 3072B are reserved. each of the non-reserved 4B sectio=
ns will
> > > > > +follow the following data structure:
> > > > > +
> > > > > +\begin{tabular}{|l|l|l|}
> > > > > +\hline
> > > > > +Bits  & Description    & M/O \\
> > > > > +\hline \hline
> > > > > +0  & SUPPORTED (1: yes, 0:no)    & M \\
> > > > > +\hline
> > > > > +31:01  & reserved    & - \\
> > > > > + \hline
> > > > > +\end{tabular}
> > > > > +
> > > > > +\subsubsection{Transport command set}\label{sec:Basic Facilities=
 of a Virtio Device / Admin Virtqueues / Admin command set / Transport comm=
and set}
> > > > > +
> > > > > +The Transport command set is a group of classes and commands wit=
hin
> > > > > +each of these classes which are transport specific. Refer to each
> > > > > +transport section for more information on the supported commands.
> > > > > +
> > > > > +\subsubsection{Device command set}\label{sec:Basic Facilities of=
 a Virtio Device / Admin Virtqueues / Admin command set / Device command se=
t}
> > > > > +
> > > > > +The Device command set is a group of classes and commands within
> > > > > +each of these classes which are device specific. Refer to each
> > > > > +device section for more information on the supported commands.
> > > > > +
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
> > > We are adding an option to add vendor specific commands. We're not ad=
ding it
> > > to the spec since each vendor will have its own manual for that.
> > You didn't actually answer the question though.
> >=20
> > > For example, we can use virtio-cli to pass command from command line =
to
> > > device in pass-through manner without changing driver.
> > >=20
> > Opaque strings passed all the way from guest userspace to host device?
> > Not sure why is that a good idea.
>=20
> Where did I mentioned a guest ?
>=20
> Virtio-cli will control a device on the same host that it runs.
>=20
> If it's a bare metal host so it will manage the virtio attached device.
>=20
> If it's a guest it will manage the device attached to the guest.

Opaqueness of all this is what worries at least me and Cornelia.


> >=20
> > > >=20
> > > > > diff --git a/content.tex b/content.tex
> > > > > index c266fd5..d350175 100644
> > > > > --- a/content.tex
> > > > > +++ b/content.tex
> > > > > @@ -407,6 +407,8 @@ \section{Exporting Objects}\label{sec:Basic F=
acilities of a Virtio Device / Expo
> > > > >    types. It is RECOMMENDED that devices generate version 4
> > > > >    UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
> > > > > +\input{admin-virtq.tex}
> > > > > +
> > > > >    \chapter{General Initialization And Device Operation}\label{se=
c:General Initialization And Device Operation}
> > > > >    We start with an overview of device initialization, then expan=
d on the
> > > > > @@ -6671,6 +6673,8 @@ \chapter{Reserved Feature Bits}\label{sec:R=
eserved Feature Bits}
> > > > >      data to be provided in driver notification and the delivery =
method is
> > > > >      transport specific.
> > > > >      For more details about driver notifications over PCI see \re=
f{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initial=
ization And Device Operation / Available Buffer Notifications}.
> > > > > +  \item[VIRTIO_F_ADMIN_VQ(40)] This feature indicates that
> > > > > +  the device supports administration virtqueue negotiation.
> > > > >    \end{description}
> > > > > --=20
> > > > > 2.21.0

