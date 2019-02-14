Return-Path: virtio-comment-return-614-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C2DA3986097
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Feb 2019 17:43:23 +0000 (UTC)
MIME-Version: 1.0
References: <20190111114200.10026-2-dgilbert@redhat.com> <20190111131540.12a8abca.cohuck@redhat.com>
 <20190111122654.GE2738@work-vm> <20190115111038.6769d292.cohuck@redhat.com>
 <20190115112303.GB2135@work-vm> <20190116115638.152d6797.cohuck@redhat.com>
 <20190116200625.GG2351@work-vm> <20190211225225.7c39154d.cohuck@redhat.com>
 <20190213183755.GF2601@work-vm> <20190214115807.2bab4efb.cohuck@redhat.com> <20190214163707.GE2617@work-vm>
In-Reply-To: <20190214163707.GE2617@work-vm>
From: Frank Yang <lfy@google.com>
Date: Thu, 14 Feb 2019 09:43:10 -0800
Message-ID: <CAEkmjvWgQg-xhOb0xLKqofi31Dzwaz1M8DQGDBgrYqO8iJ7Ubg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c88c100581de310c"
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared memory regions
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000c88c100581de310c
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 14, 2019 at 8:37 AM Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> * Cornelia Huck (cohuck@redhat.com) wrote:
> > On Wed, 13 Feb 2019 18:37:56 +0000
> > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> >
> > > * Cornelia Huck (cohuck@redhat.com) wrote:
> > > > On Wed, 16 Jan 2019 20:06:25 +0000
> > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > >
> > > > > So these are all moving this 1/3 forward - has anyone got comments
> on
> > > > > the transport specific implementations?
> > > >
> > > > No comment on pci or mmio, but I've hacked something together for
> ccw.
> > > > Basically, one sense-type ccw for discovery and a control-type ccw
> for
> > > > activation of the regions (no idea if we really need the latter),
> both
> > > > available with ccw revision 3.
> > > >
> > > > No idea whether this will work this way, though...
> > >
> > > That sounds (from a shm perspective) reasonable; can I ask why the
> > > 'activate' is needed?
> >
> > The activate interface is actually what I'm most unsure about; maybe
> > Halil can chime in.
> >
> > My basic concern is that we don't have any idea how the guest will use
> > the available memory. If the shared memory areas are supposed to be
> > mapped into an inconvenient place, the activate interface gives the
> > guest a chance to clear up that area before the host starts writing to
> > it.
>
> I'm expecting the host to map it into an area of GPA that is out of the
> way - it doesn't overlap with RAM.
> Given that, I'm not sure why the guest would have to do any 'clear up' -
> it probably wants to make a virtual mapping somewhere, but again that's
> upto the guest to do when it feels like it.
>
>
This is what we do with Vulkan as well.


> > I'm not really enthusiastic about that interface... for one, I'm not
> > sure how this plays out at the device type level, which should not
> > really concern itself with transport-specific handling.
>
> I'd expect the host side code to give an area of memory to the transport
> and tell it to map it somewhere (in the QEMU terminology a MemoryRegion
> I think).
>

I wonder if this could help: the way we're running Vulkan at the moment,
what we do is add a the concept of a MemoryRegion with no actual backing:

https://android-review.googlesource.com/q/topic:%22qemu-user-controlled-hv-mappings%22+(status:open%20OR%20status:merged)

and it would be connected to the entire PCI address space on the shared
memory address space realization. So it's kind of like a sparse or deferred
MemoryRegion.

When the guest actually wants to map a subregion associated with the host
memory,
on the host side, we can call the hypervisor to map the region, based on
giving the device implementation the functions KVM_SET_USER_MEMORY_REGION
and analogs.

This has the advantage of a smaller contact area between shm and qemu,
where the device level stuff can operate at a separate layer from
MemoryRegions which is more transport level.


> Similarly in the guest, I'm expecting the driver for the device to
> ask for a pointer to a region with a particular ID and that goes
> down to the transport code.
>
> Another option would be to map these into a special memory area that
> > the guest won't use for its normal operation... the original s390
> > (non-ccw) virtio transport mapped everything into two special pages
> > above the guest memory, but that was quite painful, and I don't think
> > we want to go down that road again.
>
> Can you explain why?
>
> Dave
>
> > >
> > > Dave
> > >
> > > > diff --git a/content.tex b/content.tex
> > > > index 836ee5236939..7f379bca932e 100644
> > > > --- a/content.tex
> > > > +++ b/content.tex
> > > > @@ -2078,6 +2078,8 @@ virtio:
> > > >  #define CCW_CMD_READ_VQ_CONF 0x32
> > > >  #define CCW_CMD_SET_VIRTIO_REV 0x83
> > > >  #define CCW_CMD_READ_STATUS 0x72
> > > > +#define CCW_CMD_GET_REGIONS 0x14
> > > > +#define CCW_CMD_MAP_REGIONS 0x93
> > > >  \end{lstlisting}
> > > >
> > > >  \subsubsection{Notifications}\label{sec:Virtio Transport Options /
> Virtio
> > > > @@ -2170,7 +2172,9 @@ The following values are supported:
> > > >  \hline
> > > >  2        & 0      & <empty>   & CCW_CMD_READ_STATUS support \\
> > > >  \hline
> > > > -3-n      &        &           & reserved for later revisions \\
> > > > +3        & 0      & <empty>   & CCW_CMD_GET_REGIONS and
> CCW_CMD_MAP_REGIONS support \\
> > > > +\hline
> > > > +4-n      &        &           & reserved for later revisions \\
> > > >  \hline
> > > >  \end{tabular}
> > > >
> > > > @@ -2449,6 +2453,72 @@ command. Some legacy devices will support
> two-stage queue indicators, though,
> > > >  and a driver will be able to successfully use
> CCW_CMD_SET_IND_ADAPTER to set
> > > >  them up.
> > > >
> > > > +\subsubsection{Handling Shared Memory Regions}\label{sec:Virtio
> Transport Options / Virtio over channel I/O / Device Initialization /
> Handling Shared Memory Regions}
> > > > +
> > > > +The CCW_CMD_GET_REGIONS command allows the driver to discover
> shared memory
> > > > +regions provided by the device, if any.
> > > > +
> > > > +The driver provides a pointer to a 4096 byte buffer that is filled
> out by
> > > > +the device:
> > > > +
> > > > +\begin{lstlisting}
> > > > +  struct shared_regions_info {
> > > > +    be64 num_regions;
> > > > +    struct shared_region_desc regions[];
> > > > +  };
> > > > +\end{lstlisting}
> > > > +
> > > > +The buffer contains 0 or more shared region descriptors, as
> specified
> > > > +by \field{num_regions}. If the devices does not provide shared
> regions,
> > > > +\field{num_regions} is 0. Otherwise, the shared region descriptors
> have
> > > > +the following format:
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct shared_region_desc {
> > > > +        be64 addr;
> > > > +        be64 len;
> > > > +        u8 id;
> > > > +        u8 pad[3];
> > > > +}
> > > > +\end{lstlisting}
> > > > +
> > > > +\field{addr} is the guest-physical address of the region with a
> length of
> > > > +\field{len}, identified by \field{id}. The contents of \field{pad}
> are
> > > > +unpredictable, although it is recommended that the device fills in
> zeroes.
> > > > +
> > > > +To activate or deactivate a shared memory region, the device uses
> the
> > > > +CCW_CMD_MAP_REGIONS command. It takes the following payload:
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct shared_region_ctrl {
> > > > +        u8 id;
> > > > +        u8 activate;
> > > > +        u8 pad[2];
> > > > +}
> > > > +\end{lstlisting}
> > > > +
> > > > +\field{id} denotes the shared memory region that is the target of
> the command,
> > > > +while \field{activate} specifies whether the region should be
> activated (if 1)
> > > > +or deactivated (if 0). When activated, the device makes the
> guest-physical
> > > > +address of the region available as a shared memory region.
> > > > +
> > > > +\devicenormative{\paragraph}{Handling Shared Memory Regions}{Virtio
> Transport Options / Virtio over channel I/O / Device Initialization /
> Handling Shared Memory Regions}
> > > > +
> > > > +The device MUST reject the CCW_CMD_GET_REGIONS and
> CCW_CMD_MAP_REGIONS
> > > > +commands if not at least revision 3 has been negotiated.
> > > > +
> > > > +The device MUST NOT read from or write to the region before it has
> been
> > > > +activated by the driver or after it has been deactivated by the
> driver.
> > > > +
> > > > +If the driver reads from or writes to an address specified to a
> region that is
> > > > +not activated by the driver, it MUST treat this read or write as a
> normal
> > > > +read or write operation.
> > > > +
> > > > +\drivernormative{\paragraph}{Handling Shared Memory Regions}{Virtio
> Transport Options / Virtio over channel I/O / Device Initialization /
> Handling Shared Memory Regions}
> > > > +
> > > > +The driver MUST NOT treat the guest-physical address of a region as
> a shared
> > > > +memory region before it has activated it or after it has
> deactivated it.
> > > > +
> > > >  \subsection{Device Operation}\label{sec:Virtio Transport Options /
> Virtio over channel I/O / Device Operation}
> > > >
> > > >  \subsubsection{Host->Guest Notification}\label{sec:Virtio Transport
> Options / Virtio over channel I/O / Device Operation / Host->Guest
> Notification}
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License:
> https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>
>

--000000000000c88c100581de310c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 14, 2019=
 at 8:37 AM Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.co=
m">dgilbert@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">* Cornelia Huck (<a href=3D"mailto:cohuck@redhat.com"=
 target=3D"_blank">cohuck@redhat.com</a>) wrote:<br>
&gt; On Wed, 13 Feb 2019 18:37:56 +0000<br>
&gt; &quot;Dr. David Alan Gilbert&quot; &lt;<a href=3D"mailto:dgilbert@redh=
at.com" target=3D"_blank">dgilbert@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; * Cornelia Huck (<a href=3D"mailto:cohuck@redhat.com" target=3D"_=
blank">cohuck@redhat.com</a>) wrote:<br>
&gt; &gt; &gt; On Wed, 16 Jan 2019 20:06:25 +0000<br>
&gt; &gt; &gt; &quot;Dr. David Alan Gilbert&quot; &lt;<a href=3D"mailto:dgi=
lbert@redhat.com" target=3D"_blank">dgilbert@redhat.com</a>&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt; &gt; So these are all moving this 1/3 forward - has anyone g=
ot comments on<br>
&gt; &gt; &gt; &gt; the transport specific implementations?=C2=A0 <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; No comment on pci or mmio, but I&#39;ve hacked something tog=
ether for ccw.<br>
&gt; &gt; &gt; Basically, one sense-type ccw for discovery and a control-ty=
pe ccw for<br>
&gt; &gt; &gt; activation of the regions (no idea if we really need the lat=
ter), both<br>
&gt; &gt; &gt; available with ccw revision 3.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; No idea whether this will work this way, though...=C2=A0 <br=
>
&gt; &gt; <br>
&gt; &gt; That sounds (from a shm perspective) reasonable; can I ask why th=
e<br>
&gt; &gt; &#39;activate&#39; is needed?<br>
&gt; <br>
&gt; The activate interface is actually what I&#39;m most unsure about; may=
be<br>
&gt; Halil can chime in.<br>
&gt; <br>
&gt; My basic concern is that we don&#39;t have any idea how the guest will=
 use<br>
&gt; the available memory. If the shared memory areas are supposed to be<br=
>
&gt; mapped into an inconvenient place, the activate interface gives the<br=
>
&gt; guest a chance to clear up that area before the host starts writing to=
<br>
&gt; it.<br>
<br>
I&#39;m expecting the host to map it into an area of GPA that is out of the=
<br>
way - it doesn&#39;t overlap with RAM.<br>
Given that, I&#39;m not sure why the guest would have to do any &#39;clear =
up&#39; -<br>
it probably wants to make a virtual mapping somewhere, but again that&#39;s=
<br>
upto the guest to do when it feels like it.<br>
<br></blockquote><div><br></div><div>This is what we do with Vulkan as well=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; I&#39;m not really enthusiastic about that interface... for one, I&#39=
;m not<br>
&gt; sure how this plays out at the device type level, which should not<br>
&gt; really concern itself with transport-specific handling.<br>
<br>
I&#39;d expect the host side code to give an area of memory to the transpor=
t<br>
and tell it to map it somewhere (in the QEMU terminology a MemoryRegion<br>
I think).<br></blockquote><div><br></div><div>I wonder if this could help: =
the way we&#39;re running Vulkan at the moment, what we do is add a the con=
cept of a MemoryRegion with no actual backing:</div><div><br></div><div><a =
href=3D"https://android-review.googlesource.com/q/topic:%22qemu-user-contro=
lled-hv-mappings%22+(status:open%20OR%20status:merged)">https://android-rev=
iew.googlesource.com/q/topic:%22qemu-user-controlled-hv-mappings%22+(status=
:open%20OR%20status:merged)</a><br></div><div><br></div><div>and it would b=
e connected to the entire PCI address space on the shared memory address sp=
ace realization. So it&#39;s kind of like a sparse or deferred MemoryRegion=
.</div><div><br></div><div>When the guest actually wants to map a subregion=
 associated with the host memory,</div><div>on the host side, we can call t=
he hypervisor to map the region, based on giving the device implementation =
the functions KVM_SET_USER_MEMORY_REGION and analogs.</div><div><br></div><=
div>This has the advantage of a smaller contact area between shm and qemu,<=
/div><div>where the device level stuff can operate at a separate layer from=
 MemoryRegions which is more transport level.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Similarly in the guest, I&#39;m expecting the driver for the device to<br>
ask for a pointer to a region with a particular ID and that goes<br>
down to the transport code.=C2=A0<br></blockquote><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt; Another option would be to map these into a special memory area that<b=
r>
&gt; the guest won&#39;t use for its normal operation... the original s390<=
br>
&gt; (non-ccw) virtio transport mapped everything into two special pages<br=
>
&gt; above the guest memory, but that was quite painful, and I don&#39;t th=
ink<br>
&gt; we want to go down that road again.<br>
<br>
Can you explain why?<br>
<br>
Dave<br>
<br>
&gt; &gt; <br>
&gt; &gt; Dave<br>
&gt; &gt; <br>
&gt; &gt; &gt; diff --git a/content.tex b/content.tex<br>
&gt; &gt; &gt; index 836ee5236939..7f379bca932e 100644<br>
&gt; &gt; &gt; --- a/content.tex<br>
&gt; &gt; &gt; +++ b/content.tex<br>
&gt; &gt; &gt; @@ -2078,6 +2078,8 @@ virtio:<br>
&gt; &gt; &gt;=C2=A0 #define CCW_CMD_READ_VQ_CONF 0x32<br>
&gt; &gt; &gt;=C2=A0 #define CCW_CMD_SET_VIRTIO_REV 0x83<br>
&gt; &gt; &gt;=C2=A0 #define CCW_CMD_READ_STATUS 0x72<br>
&gt; &gt; &gt; +#define CCW_CMD_GET_REGIONS 0x14<br>
&gt; &gt; &gt; +#define CCW_CMD_MAP_REGIONS 0x93<br>
&gt; &gt; &gt;=C2=A0 \end{lstlisting}<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 \subsubsection{Notifications}\label{sec:Virtio Transpo=
rt Options / Virtio<br>
&gt; &gt; &gt; @@ -2170,7 +2172,9 @@ The following values are supported:<br=
>
&gt; &gt; &gt;=C2=A0 \hline<br>
&gt; &gt; &gt;=C2=A0 2=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp; 0=C2=A0 =C2=A0 =C2=
=A0 &amp; &lt;empty&gt;=C2=A0 =C2=A0&amp; CCW_CMD_READ_STATUS support \\<br=
>
&gt; &gt; &gt;=C2=A0 \hline<br>
&gt; &gt; &gt; -3-n=C2=A0 =C2=A0 =C2=A0 &amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &a=
mp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; reserved for later revisi=
ons \\<br>
&gt; &gt; &gt; +3=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp; 0=C2=A0 =C2=A0 =C2=A0 &a=
mp; &lt;empty&gt;=C2=A0 =C2=A0&amp; CCW_CMD_GET_REGIONS and CCW_CMD_MAP_REG=
IONS support \\<br>
&gt; &gt; &gt; +\hline<br>
&gt; &gt; &gt; +4-n=C2=A0 =C2=A0 =C2=A0 &amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &a=
mp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; reserved for later revisi=
ons \\<br>
&gt; &gt; &gt;=C2=A0 \hline<br>
&gt; &gt; &gt;=C2=A0 \end{tabular}<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; @@ -2449,6 +2453,72 @@ command. Some legacy devices will sup=
port two-stage queue indicators, though,<br>
&gt; &gt; &gt;=C2=A0 and a driver will be able to successfully use CCW_CMD_=
SET_IND_ADAPTER to set<br>
&gt; &gt; &gt;=C2=A0 them up.<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; +\subsubsection{Handling Shared Memory Regions}\label{sec:Vi=
rtio Transport Options / Virtio over channel I/O / Device Initialization / =
Handling Shared Memory Regions}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +The CCW_CMD_GET_REGIONS command allows the driver to discov=
er shared memory<br>
&gt; &gt; &gt; +regions provided by the device, if any.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +The driver provides a pointer to a 4096 byte buffer that is=
 filled out by<br>
&gt; &gt; &gt; +the device:<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +\begin{lstlisting}<br>
&gt; &gt; &gt; +=C2=A0 struct shared_regions_info {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 be64 num_regions;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 struct shared_region_desc regions[];<br>
&gt; &gt; &gt; +=C2=A0 };<br>
&gt; &gt; &gt; +\end{lstlisting}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +The buffer contains 0 or more shared region descriptors, as=
 specified<br>
&gt; &gt; &gt; +by \field{num_regions}. If the devices does not provide sha=
red regions,<br>
&gt; &gt; &gt; +\field{num_regions} is 0. Otherwise, the shared region desc=
riptors have<br>
&gt; &gt; &gt; +the following format:<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +\begin{lstlisting}<br>
&gt; &gt; &gt; +struct shared_region_desc {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 be64 addr;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 be64 len;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 id;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 pad[3];<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +\end{lstlisting}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +\field{addr} is the guest-physical address of the region wi=
th a length of<br>
&gt; &gt; &gt; +\field{len}, identified by \field{id}. The contents of \fie=
ld{pad} are<br>
&gt; &gt; &gt; +unpredictable, although it is recommended that the device f=
ills in zeroes.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +To activate or deactivate a shared memory region, the devic=
e uses the<br>
&gt; &gt; &gt; +CCW_CMD_MAP_REGIONS command. It takes the following payload=
:<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +\begin{lstlisting}<br>
&gt; &gt; &gt; +struct shared_region_ctrl {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 id;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 activate;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 pad[2];<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +\end{lstlisting}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +\field{id} denotes the shared memory region that is the tar=
get of the command,<br>
&gt; &gt; &gt; +while \field{activate} specifies whether the region should =
be activated (if 1)<br>
&gt; &gt; &gt; +or deactivated (if 0). When activated, the device makes the=
 guest-physical<br>
&gt; &gt; &gt; +address of the region available as a shared memory region.<=
br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +\devicenormative{\paragraph}{Handling Shared Memory Regions=
}{Virtio Transport Options / Virtio over channel I/O / Device Initializatio=
n / Handling Shared Memory Regions}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +The device MUST reject the CCW_CMD_GET_REGIONS and CCW_CMD_=
MAP_REGIONS<br>
&gt; &gt; &gt; +commands if not at least revision 3 has been negotiated.<br=
>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +The device MUST NOT read from or write to the region before=
 it has been<br>
&gt; &gt; &gt; +activated by the driver or after it has been deactivated by=
 the driver.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +If the driver reads from or writes to an address specified =
to a region that is<br>
&gt; &gt; &gt; +not activated by the driver, it MUST treat this read or wri=
te as a normal<br>
&gt; &gt; &gt; +read or write operation.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +\drivernormative{\paragraph}{Handling Shared Memory Regions=
}{Virtio Transport Options / Virtio over channel I/O / Device Initializatio=
n / Handling Shared Memory Regions}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +The driver MUST NOT treat the guest-physical address of a r=
egion as a shared<br>
&gt; &gt; &gt; +memory region before it has activated it or after it has de=
activated it.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 \subsection{Device Operation}\label{sec:Virtio Transpo=
rt Options / Virtio over channel I/O / Device Operation}<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 \subsubsection{Host-&gt;Guest Notification}\label{sec:=
Virtio Transport Options / Virtio over channel I/O / Device Operation / Hos=
t-&gt;Guest Notification}=C2=A0 <br>
&gt; &gt; --<br>
&gt; &gt; Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" t=
arget=3D"_blank">dgilbert@redhat.com</a> / Manchester, UK<br>
&gt; <br>
&gt; <br>
&gt; This publicly archived list offers a means to provide input to the<br>
&gt; OASIS Virtual I/O Device (VIRTIO) TC.<br>
&gt; <br>
&gt; In order to verify user consent to the Feedback License terms and<br>
&gt; to minimize spam in the list archive, subscription is required<br>
&gt; before posting.<br>
&gt; <br>
&gt; Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis-open=
.org" target=3D"_blank">virtio-comment-subscribe@lists.oasis-open.org</a><b=
r>
&gt; Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.oasis-=
open.org" target=3D"_blank">virtio-comment-unsubscribe@lists.oasis-open.org=
</a><br>
&gt; List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open.org"=
 target=3D"_blank">virtio-comment-help@lists.oasis-open.org</a><br>
&gt; List archive: <a href=3D"https://lists.oasis-open.org/archives/virtio-=
comment/" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-open.org=
/archives/virtio-comment/</a><br>
&gt; Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/feedba=
ck_license.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open=
.org/who/ipr/feedback_license.pdf</a><br>
&gt; List Guidelines: <a href=3D"https://www.oasis-open.org/policies-guidel=
ines/mailing-lists" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-=
open.org/policies-guidelines/mailing-lists</a><br>
&gt; Committee: <a href=3D"https://www.oasis-open.org/committees/virtio/" r=
el=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/committees/v=
irtio/</a><br>
&gt; Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"norefe=
rrer" target=3D"_blank">https://www.oasis-open.org/join/</a><br>
&gt; <br>
--<br>
Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" target=3D"_=
blank">dgilbert@redhat.com</a> / Manchester, UK<br>
<br>
This publicly archived list offers a means to provide input to the<br>
OASIS Virtual I/O Device (VIRTIO) TC.<br>
<br>
In order to verify user consent to the Feedback License terms and<br>
to minimize spam in the list archive, subscription is required<br>
before posting.<br>
<br>
Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis-open.org"=
 target=3D"_blank">virtio-comment-subscribe@lists.oasis-open.org</a><br>
Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.oasis-open.=
org" target=3D"_blank">virtio-comment-unsubscribe@lists.oasis-open.org</a><=
br>
List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open.org" targ=
et=3D"_blank">virtio-comment-help@lists.oasis-open.org</a><br>
List archive: <a href=3D"https://lists.oasis-open.org/archives/virtio-comme=
nt/" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-open.org/arch=
ives/virtio-comment/</a><br>
Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/feedback_li=
cense.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/=
who/ipr/feedback_license.pdf</a><br>
List Guidelines: <a href=3D"https://www.oasis-open.org/policies-guidelines/=
mailing-lists" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.=
org/policies-guidelines/mailing-lists</a><br>
Committee: <a href=3D"https://www.oasis-open.org/committees/virtio/" rel=3D=
"noreferrer" target=3D"_blank">https://www.oasis-open.org/committees/virtio=
/</a><br>
Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"noreferrer"=
 target=3D"_blank">https://www.oasis-open.org/join/</a><br>
<br>
</blockquote></div></div></div>

--000000000000c88c100581de310c--
