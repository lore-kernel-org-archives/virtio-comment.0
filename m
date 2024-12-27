Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F50442F
	for <virtio-comment@lists.linux.dev>; Fri, 27 Dec 2024 01:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735262819; cv=none; b=E2AGLnwxS2O2RCCmPWJhvqReEmob6PfOjPjm23CGXxUGrF5ndjXmdbg4uG3b5qYR6djbG6oDbt3S/vylcBc63keukpcEu0Ou8oW5adM/quxKsWoBhOqqXX+kpugvoFLLMThqBxGn0KF1N1UtsHQbbnMmxNXt63cLKrSin5GS1oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735262819; c=relaxed/simple;
	bh=dhicamqYfrdMeQLb2rMloALGRco4THW/uEaNItt0jc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmEpEEMQleWBYwLvguOzdafFZ/zV87IqvXcYWy4tR9JjqQo68xZhbwTkAwRfDmH390v+yvZ4GB/3KFqFPro/mZ9lchIayoErwdF5GbHdtXqd/JqMcdNj14a7TbvrTY+YI6A3vlbzQuG+hja/02Ee/vhZhlw6U3E+6+4oe5OKY1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ES+INLVk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ES+INLVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735262815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WGbJGJ/+0vIv/BWsPtrCo+n/llxx7zAzs0x8eofz9F4=;
	b=ES+INLVkTkxU+QFYZX11IhQ7UFGaFAM5a+MVdn5ft8bGcmjI6NusG0rXG0ZVENh0LbIUaK
	5cnYu76Sglek6HOdNnR0eIHuCdcO8696iCqer3j55oMOKRtJrsmuJvPtHqrd1LLcyWDHTf
	IUCTuDBQW6qSiFXWvNwcSmZF5sv9LU8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-k4gBxXn8N0qEugDlMQxKjg-1; Thu, 26 Dec 2024 20:26:54 -0500
X-MC-Unique: k4gBxXn8N0qEugDlMQxKjg-1
X-Mimecast-MFC-AGG-ID: k4gBxXn8N0qEugDlMQxKjg
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216266cc0acso81613475ad.0
        for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 17:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735262813; x=1735867613;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGbJGJ/+0vIv/BWsPtrCo+n/llxx7zAzs0x8eofz9F4=;
        b=gZYoK64Z9GRR6aCOa9LgP/QLd6svSNO0EMaz8LQjLQi7f590fTpZEbHXvyQ9UW+KH2
         pEAFcFgQe7y7KU2tD0aEjccEWF33n8rWgh6hTSchgs18m0DogmLINhALdvTIbDueaz9t
         utAv7JY181MB8XfJFuy08NtcaZDz1c+D2/lGSIaG6B2mtx5cZWRecZDDi98z+8GmAotk
         WsbuEFdK90Ct5Wc9li0Cme7TqF/0TSSAWJ1p3+wrjDRduBX9wtejmuqTA0+JGvGkEJAu
         hMIEWSA/9ZA2JHnGB++brwckMo0roDbENG44U2kdbewkGuOJKJNFrnTu3nm0gj2QMde5
         qt2g==
X-Forwarded-Encrypted: i=1; AJvYcCV7NCS8JqY2smctojJbICtSfp0f6pif1Wb3g8p7aWcTSPvmxeEh6XiFva9Uwo8ybL2YKHx+UGLE1I5pk2Pcgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKR1oU6YVghCTQFWA1Ld+l6ODgyFH3dLHqfJDL97P082U9deTX
	qeB1lBgGOoIkeQkf9dobMa1C+l3+fxPQ/7NUgqWycmoz5Y1CTzwNeauobowuUYahL5SogzW8fFw
	4R1h20OtiajAXBVymXyn8FZRtME9Kst1cW8Cou3Tvkc0E+IvYfzD5/W+oF3MPw6IOC9MFR3DXdt
	OOvWLVxdt83iYiVP38yzUiR+v2HF50VlguOfVM/+4=
X-Gm-Gg: ASbGncsxVyltwqWb6yDZq1klr+I4EMAn/LFmHvDwNhFSFVVfR1Fhds2XvifAFtSnzpr
	dEVtg8p5qsX4XFwcRI+GolbP7unuVMctx0P8hMu4=
X-Received: by 2002:a05:6a00:35ca:b0:72a:78a3:7f57 with SMTP id d2e1a72fcca58-72abdb94495mr36497108b3a.9.1735262812841;
        Thu, 26 Dec 2024 17:26:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3+2o8eAm06zgyNLWdKLJ9VYKU8+VXH7mgV1/uGzB8xOOQ+MBtkX7AXPEsnFKBzPLlYwoy+nIo8DcyLIbBR0U=
X-Received: by 2002:a05:6a00:35ca:b0:72a:78a3:7f57 with SMTP id
 d2e1a72fcca58-72abdb94495mr36497080b3a.9.1735262812352; Thu, 26 Dec 2024
 17:26:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241226-reserved-v1-1-39ca566889c0@daynix.com>
 <20241226022749-mutt-send-email-mst@kernel.org> <20241226023128-mutt-send-email-mst@kernel.org>
 <5fe377c4-c10d-4c4d-8e8f-30420989452d@daynix.com> <20241226041018-mutt-send-email-mst@kernel.org>
 <452e2ba7-ef5a-4d89-8e25-93cbdf767011@daynix.com> <20241226064040-mutt-send-email-mst@kernel.org>
In-Reply-To: <20241226064040-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 27 Dec 2024 09:26:40 +0800
Message-ID: <CACGkMEu5E_RK8MZAMx-AM04MHWis3Wk5LDYPhzMhH_BrNf9DNQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: Ignore num_buffers when unused
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, virtio-comment@lists.linux.dev, 
	Parav Pandit <parav@nvidia.com>, devel@daynix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zPuXZU0DrKYxSJ2e-WmIi4XgLuM70wwhJFWjQK6vEBM_1735262813
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000085cf97062a365bc3"

--00000000000085cf97062a365bc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 7:56=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:

> On Thu, Dec 26, 2024 at 08:09:59PM +0900, Akihiko Odaki wrote:
> > On 2024/12/26 18:13, Michael S. Tsirkin wrote:
> > > On Thu, Dec 26, 2024 at 04:35:55PM +0900, Akihiko Odaki wrote:
> > > > On 2024/12/26 16:32, Michael S. Tsirkin wrote:
> > > > > On Thu, Dec 26, 2024 at 02:29:09AM -0500, Michael S. Tsirkin wrot=
e:
> > > > > > On Thu, Dec 26, 2024 at 02:37:17PM +0900, Akihiko Odaki wrote:
> > > > > > > If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net
> and QEMU
> > > > > > > sets num_buffers to zero while the specification tells to set
> it to one.
> > > > > > >
> > > > > > > Let drivers ignore the field to make them compatible with bot=
h
> > > > > > > vhost_net/QEMU and devices already compliant with the
> specification.
> > > > > > > Also, remove statements requiring devices to set the field to
> one to
> > > > > > > make vhost_net and QEMU compliant.
> > > > > > >
> > > > > > > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > > > > > > ---
> > > > > > >    device-types/net/description.tex | 26
> +++++++++++---------------
> > > > > > >    1 file changed, 11 insertions(+), 15 deletions(-)
> > > > > > >
> > > > > > > diff --git a/device-types/net/description.tex
> b/device-types/net/description.tex
> > > > > > > index 76585b0..b82fe8f 100644
> > > > > > > --- a/device-types/net/description.tex
> > > > > > > +++ b/device-types/net/description.tex
> > > > > > > @@ -683,15 +683,12 @@ \subsubsection{Setting Up Receive
> Buffers}\label{sec:Device Types / Network Devi
> > > > > > >    \devicenormative{\paragraph}{Setting Up Receive
> Buffers}{Device Types / Network Device / Device Operation / Setting Up
> Receive Buffers}
> > > > > > > -The device MUST set \field{num_buffers} to the number of
> descriptors used to
> > > > > > > -hold the incoming packet.
> > > > > > > +If VIRTIO_NET_F_MRG_RXBUF was negotiated, the device MUST se=
t
> > > > > > > +\field{num_buffers} to the number of descriptors used to hol=
d
> the incoming
> > > > > > > +packet.
> > > > > > >    The device MUST use only a single descriptor if
> VIRTIO_NET_F_MRG_RXBUF
> > > > > > >    was not negotiated.
> > > > > > > -\begin{note}
> > > > > > > -{This means that \field{num_buffers} will always be 1
> > > > > > > -if VIRTIO_NET_F_MRG_RXBUF is not negotiated.}
> > > > > > > -\end{note}
> > > > > > >    \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network Device / Device Operation /
> Processing of Incoming Packets}
> > > > > > >    \label{sec:Device Types / Network Device / Device Operatio=
n
> / Processing of Packets}%old label for latexdiff
> > > > > > > @@ -704,9 +701,8 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
> > > > > > >    Processing incoming packets involves:
> > > > > > >    \begin{enumerate}
> > > > > > > -\item \field{num_buffers} indicates how many descriptors
> > > > > > > -  this packet is spread over (including this one): this will
> > > > > > > -  always be 1 if VIRTIO_NET_F_MRG_RXBUF was not negotiated.
> > > > > > > +\item If VIRTIO_NET_F_MRG_RXBUF was negogiated,
> \field{num_buffers} indicates
> > > > > > > +  how many descriptors this packet is spread over (including
> this one).
> > > > > > >      This allows receipt of large packets without having to
> allocate large
> > > > > > >      buffers: a packet that does not fit in a single buffer
> can flow
> > > > > > >      over to the next buffer, and so on. In this case, there
> will be
> > > > > > > @@ -717,9 +713,9 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
> > > > > > >      The other buffers will not begin with a struct
> virtio_net_hdr.
> > > > > > >    \item If
> > > > > > > -  \field{num_buffers} is one, then the entire packet will be
> > > > > > > -  contained within this buffer, immediately following the
> struct
> > > > > > > -  virtio_net_hdr.
> > > > > > > +  VIRTIO_NET_F_MRG_RXBUF was not negotiated or
> \field{num_buffers} is one, then
> > > > > > > +  the entire packet will be contained within this buffer,
> immediately following
> > > > > > > +  the struct virtio_net_hdr.
> > > > > > >    \item If the VIRTIO_NET_F_GUEST_CSUM feature was
> negotiated, the
> > > > > > >      VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
> > > > > > >      set: if so, device has validated the packet checksum.
> > > > > > > @@ -764,9 +760,6 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
> > > > > > >    \devicenormative{\paragraph}{Processing of Incoming
> Packets}{Device Types / Network Device / Device Operation / Processing of
> Incoming Packets}
> > > > > > >    \label{devicenormative:Device Types / Network Device /
> Device Operation / Processing of Packets}%old label for latexdiff
> > > > > > > -If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the devic=
e
> MUST set
> > > > > > > -\field{num_buffers} to 1.
> > > > > > > -
> > > > > > >    If VIRTIO_NET_F_MRG_RXBUF has been negotiated, the device
> MUST set
> > > > > > >    \field{num_buffers} to indicate the number of buffers
> > > > > > >    the packet (including the header) is spread over.
> > > > > > > @@ -863,6 +856,9 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
> > > > > > >    This is due to various bugs in implementations.
> > > > > > >    \end{note}
> > > > > > > +If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the drive=
r
> MUST ignore
> > > > > > > +\field{num_buffers}.
> > > > > > > +
> > > > > > >    If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
> > > > > > >    VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
> > > > > > >    rely on the packet checksum being correct.
> > > > > >
> > > > > >
> > > > > > There could be drivers relying on it.
> > > > > > We can add a SHOULD not and ask drivers not to look at it,
> > > >
> > > > The patch adds the following statement:
> > > > > If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUS=
T
> > > > > ignore \field{num_buffers}.
> > > >
> > > > Do you suggest changing MUST to SHOULD or rephrase other words in
> this
> > > > statement?
> > >
> > > Yes, I would change MUST to SHOULD. Basically documenting the existin=
g
> > > practice.
> > >
> > > But I do not yes see why we should drop the device requirements the
> way you suggest.
> > > We just need to fix devices, it does not seem hard.
> >
> > Well, I think we have already discussed and decided not to change
> vhost_net:
> >
> https://lore.kernel.org/all/CACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1Yv=
mAr72Q@mail.gmail.com/
>
> Looking at this spec made me realize fixing that is less risky.
>

It depends on how to do the relaxing, if we want to align the spec to the
implementation, can we simply remove this:

-If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
-\field{num_buffers} to 1.

?

Thanks


> I just replied on that thread and proposed a way to reduce risk
> even more.
> Sorry about leading you astray.
>
> > >
> > > > > > and we should fix devices.
> > > > >
> > > > > Maybe allowing 0 too is a good idea? Need to think through
> > > > > implemenation concerns.
> > > > > In any case, pls fix devices.
> > > >
> > > > I opted allowing any values for devices based on the discussion in
> the
> > > > following thread:
> > > >
> https://lore.kernel.org/virtio-comment/CY8PR12MB7195E5A1D321CABBA97D3FD7D=
C0D2@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m5789536fe7405a7be18e167ff5=
22c27333656fe9
> > > >
> > > > Regards,
> > > > Akihiko Odaki
> > >
> > > That one asks for concrete data.
> >
> > It asks concrete data that motivates requiring setting the value to zer=
o
> and
> > I decided removing such a requirement instead.
> >
> > Regards,
> > Akihiko Odaki
>
> Same thing really.
>
>

--00000000000085cf97062a365bc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Dec 26, 2024 at 7:56=E2=80=AFPM Michael S. Tsirkin &lt;<a hr=
ef=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Dec 26=
, 2024 at 08:09:59PM +0900, Akihiko Odaki wrote:<br>
&gt; On 2024/12/26 18:13, Michael S. Tsirkin wrote:<br>
&gt; &gt; On Thu, Dec 26, 2024 at 04:35:55PM +0900, Akihiko Odaki wrote:<br=
>
&gt; &gt; &gt; On 2024/12/26 16:32, Michael S. Tsirkin wrote:<br>
&gt; &gt; &gt; &gt; On Thu, Dec 26, 2024 at 02:29:09AM -0500, Michael S. Ts=
irkin wrote:<br>
&gt; &gt; &gt; &gt; &gt; On Thu, Dec 26, 2024 at 02:37:17PM +0900, Akihiko =
Odaki wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; If VIRTIO_NET_F_MRG_RXBUF has not been negotu=
ated, vhost_net and QEMU<br>
&gt; &gt; &gt; &gt; &gt; &gt; sets num_buffers to zero while the specificat=
ion tells to set it to one.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Let drivers ignore the field to make them com=
patible with both<br>
&gt; &gt; &gt; &gt; &gt; &gt; vhost_net/QEMU and devices already compliant =
with the specification.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Also, remove statements requiring devices to =
set the field to one to<br>
&gt; &gt; &gt; &gt; &gt; &gt; make vhost_net and QEMU compliant.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Akihiko Odaki &lt;<a href=3D"m=
ailto:akihiko.odaki@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com<=
/a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 device-types/net/description.tex=
 | 26 +++++++++++---------------<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 1 file changed, 11 insertions(+)=
, 15 deletions(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/device-types/net/description.tex=
 b/device-types/net/description.tex<br>
&gt; &gt; &gt; &gt; &gt; &gt; index 76585b0..b82fe8f 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/device-types/net/description.tex<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/device-types/net/description.tex<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -683,15 +683,12 @@ \subsubsection{Setting =
Up Receive Buffers}\label{sec:Device Types / Network Devi<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 \devicenormative{\paragraph}{Set=
ting Up Receive Buffers}{Device Types / Network Device / Device Operation /=
 Setting Up Receive Buffers}<br>
&gt; &gt; &gt; &gt; &gt; &gt; -The device MUST set \field{num_buffers} to t=
he number of descriptors used to<br>
&gt; &gt; &gt; &gt; &gt; &gt; -hold the incoming packet.<br>
&gt; &gt; &gt; &gt; &gt; &gt; +If VIRTIO_NET_F_MRG_RXBUF was negotiated, th=
e device MUST set<br>
&gt; &gt; &gt; &gt; &gt; &gt; +\field{num_buffers} to the number of descrip=
tors used to hold the incoming<br>
&gt; &gt; &gt; &gt; &gt; &gt; +packet.<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 The device MUST use only a singl=
e descriptor if VIRTIO_NET_F_MRG_RXBUF<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 was not negotiated.<br>
&gt; &gt; &gt; &gt; &gt; &gt; -\begin{note}<br>
&gt; &gt; &gt; &gt; &gt; &gt; -{This means that \field{num_buffers} will al=
ways be 1<br>
&gt; &gt; &gt; &gt; &gt; &gt; -if VIRTIO_NET_F_MRG_RXBUF is not negotiated.=
}<br>
&gt; &gt; &gt; &gt; &gt; &gt; -\end{note}<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 \subsubsection{Processing of Inc=
oming Packets}\label{sec:Device Types / Network Device / Device Operation /=
 Processing of Incoming Packets}<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 \label{sec:Device Types / Networ=
k Device / Device Operation / Processing of Packets}%old label for latexdif=
f<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -704,9 +701,8 @@ \subsubsection{Processing=
 of Incoming Packets}\label{sec:Device Types / Network<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 Processing incoming packets invo=
lves:<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 \begin{enumerate}<br>
&gt; &gt; &gt; &gt; &gt; &gt; -\item \field{num_buffers} indicates how many=
 descriptors<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 this packet is spread over (including=
 this one): this will<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 always be 1 if VIRTIO_NET_F_MRG_RXBUF=
 was not negotiated.<br>
&gt; &gt; &gt; &gt; &gt; &gt; +\item If VIRTIO_NET_F_MRG_RXBUF was negogiat=
ed, \field{num_buffers} indicates<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 how many descriptors this packet is s=
pread over (including this one).<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 This allows receipt of la=
rge packets without having to allocate large<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 buffers: a packet that do=
es not fit in a single buffer can flow<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 over to the next buffer, =
and so on. In this case, there will be<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -717,9 +713,9 @@ \subsubsection{Processing=
 of Incoming Packets}\label{sec:Device Types / Network<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 The other buffers will no=
t begin with a struct virtio_net_hdr.<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 \item If<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 \field{num_buffers} is one, then the =
entire packet will be<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 contained within this buffer, immedia=
tely following the struct<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 virtio_net_hdr.<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 VIRTIO_NET_F_MRG_RXBUF was not negoti=
ated or \field{num_buffers} is one, then<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 the entire packet will be contained w=
ithin this buffer, immediately following<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 the struct virtio_net_hdr.<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 \item If the VIRTIO_NET_F_GUEST_=
CSUM feature was negotiated, the<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 VIRTIO_NET_HDR_F_DATA_VAL=
ID bit in \field{flags} can be<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 set: if so, device has va=
lidated the packet checksum.<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -764,9 +760,6 @@ \subsubsection{Processing=
 of Incoming Packets}\label{sec:Device Types / Network<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 \devicenormative{\paragraph}{Pro=
cessing of Incoming Packets}{Device Types / Network Device / Device Operati=
on / Processing of Incoming Packets}<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 \label{devicenormative:Device Ty=
pes / Network Device / Device Operation / Processing of Packets}%old label =
for latexdiff<br>
&gt; &gt; &gt; &gt; &gt; &gt; -If VIRTIO_NET_F_MRG_RXBUF has not been negot=
iated, the device MUST set<br>
&gt; &gt; &gt; &gt; &gt; &gt; -\field{num_buffers} to 1.<br>
&gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 If VIRTIO_NET_F_MRG_RXBUF has be=
en negotiated, the device MUST set<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 \field{num_buffers} to indicate =
the number of buffers<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 the packet (including the header=
) is spread over.<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -863,6 +856,9 @@ \subsubsection{Processing=
 of Incoming Packets}\label{sec:Device Types / Network<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 This is due to various bugs in i=
mplementations.<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 \end{note}<br>
&gt; &gt; &gt; &gt; &gt; &gt; +If VIRTIO_NET_F_MRG_RXBUF has not been negot=
iated, the driver MUST ignore<br>
&gt; &gt; &gt; &gt; &gt; &gt; +\field{num_buffers}.<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 If neither VIRTIO_NET_HDR_F_NEED=
S_CSUM nor<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 VIRTIO_NET_HDR_F_DATA_VALID is s=
et, the driver MUST NOT<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 rely on the packet checksum bein=
g correct.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; There could be drivers relying on it.<br>
&gt; &gt; &gt; &gt; &gt; We can add a SHOULD not and ask drivers not to loo=
k at it,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The patch adds the following statement:<br>
&gt; &gt; &gt; &gt; If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the =
driver MUST<br>
&gt; &gt; &gt; &gt; ignore \field{num_buffers}.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Do you suggest changing MUST to SHOULD or rephrase other wor=
ds in this<br>
&gt; &gt; &gt; statement?<br>
&gt; &gt; <br>
&gt; &gt; Yes, I would change MUST to SHOULD. Basically documenting the exi=
sting<br>
&gt; &gt; practice.<br>
&gt; &gt; <br>
&gt; &gt; But I do not yes see why we should drop the device requirements t=
he way you suggest.<br>
&gt; &gt; We just need to fix devices, it does not seem hard.<br>
&gt; <br>
&gt; Well, I think we have already discussed and decided not to change vhos=
t_net:<br>
&gt; <a href=3D"https://lore.kernel.org/all/CACGkMEt0spn59oLyoCwcJDdLeYUEib=
ePF7gppxdVX1YvmAr72Q@mail.gmail.com/" rel=3D"noreferrer" target=3D"_blank">=
https://lore.kernel.org/all/CACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1YvmA=
r72Q@mail.gmail.com/</a><br>
<br>
Looking at this spec made me realize fixing that is less risky.<br></blockq=
uote><div><br></div><div>It depends on how to do the relaxing, if we want t=
o align the spec to the implementation, can we simply remove this:</div><di=
v><br></div><div>-If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the de=
vice MUST set<br>-\field{num_buffers} to 1.</div><div><br></div><div>?</div=
><div><br></div><div>Thanks</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
I just replied on that thread and proposed a way to reduce risk<br>
even more.<br>
Sorry about leading you astray.<br>
<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; and we should fix devices.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Maybe allowing 0 too is a good idea? Need to think thro=
ugh<br>
&gt; &gt; &gt; &gt; implemenation concerns.<br>
&gt; &gt; &gt; &gt; In any case, pls fix devices.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I opted allowing any values for devices based on the discuss=
ion in the<br>
&gt; &gt; &gt; following thread:<br>
&gt; &gt; &gt; <a href=3D"https://lore.kernel.org/virtio-comment/CY8PR12MB7=
195E5A1D321CABBA97D3FD7DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m57=
89536fe7405a7be18e167ff522c27333656fe9" rel=3D"noreferrer" target=3D"_blank=
">https://lore.kernel.org/virtio-comment/CY8PR12MB7195E5A1D321CABBA97D3FD7D=
C0D2@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m5789536fe7405a7be18e167ff5=
22c27333656fe9</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; Akihiko Odaki<br>
&gt; &gt; <br>
&gt; &gt; That one asks for concrete data.<br>
&gt; <br>
&gt; It asks concrete data that motivates requiring setting the value to ze=
ro and<br>
&gt; I decided removing such a requirement instead.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Akihiko Odaki<br>
<br>
Same thing really.<br>
<br>
</blockquote></div></div>
</div>

--00000000000085cf97062a365bc3--

