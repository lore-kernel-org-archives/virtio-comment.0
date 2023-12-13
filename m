Return-Path: <virtio-comment-return-8795-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32176C4332F
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 10:29:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6D0702A8EA
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 10:29:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4DE3C9866B7
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 10:29:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3405A98669C; Wed, 13 Dec 2023 10:29:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 235249866AC
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Dec 2023 10:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702463340; x=1703068140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFsmJcJUTmXSlRDtjf56EU12FF1WFhE4EmXsldFSy6U=;
        b=a31VjQh46Ple175OQTf3aiYXZzZjPunQ13JrCbAPYoAcPJBVK6CWXBPdeZPo5+8+VY
         jsTYN6tMO2JwNnnognV2d10EAvr+ZwzbcHdETrbzT+tsnjP2IP2andbsxPO4Q8oBmTrW
         9Y2OZ+Prgh+u4khUuhyhxu6NgqJCn75nyTctQ6ye31NySzgoJjeoFa3Zq5l79hq43QjX
         lHDLImtsrZDPpkRtRJXpEwVUhVNM0wsiFPzMYyVsNeaex+rOgzN/d847eSit0976oQrv
         WFTM9YEsLekEioCqIqRQsXL8PO0U4K/14wvZkfXjDaNUihfoSiYXjXsS213JRTEu2RNn
         c8WA==
X-Gm-Message-State: AOJu0Yy58ixMKbV+GB6iKs2KuUtHtEgTyX9MeX8ge/nX5oC6jozjc/W3
	d1NSXlJTwLQo/jcdEsXcB6wG0CFMfNQUANKsrx0EPQ==
X-Google-Smtp-Source: AGHT+IGyTpzPojBSZXMEhN5N6/6RSwWEH7yWHQhyUuqcEK1HT8xVoeG4fSPsknkKAYNXS6KWV1fQfN9n1H6aXvWWdC0=
X-Received: by 2002:a2e:a406:0:b0:2ca:4b7:a933 with SMTP id
 p6-20020a2ea406000000b002ca04b7a933mr2221852ljn.51.1702463339995; Wed, 13 Dec
 2023 02:28:59 -0800 (PST)
MIME-Version: 1.0
References: <20231110124040.2093394-1-parav@nvidia.com> <20231110124040.2093394-2-parav@nvidia.com>
 <1702449795.6038718-6-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1702449795.6038718-6-xuanzhuo@linux.alibaba.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 13 Dec 2023 12:28:48 +0200
Message-ID: <CAOEp5OdpmQxUhsZ4U-Syx5yRt6FAHQpwmAZQJb3pXqzj9bhDZw@mail.gmail.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Parav Pandit <parav@nvidia.com>, shahafs@nvidia.com, 
	virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com
Content-Type: multipart/alternative; boundary="0000000000009fb807060c61a2c6"
Subject: Re: [virtio-comment] [PATCH 1/2] virtio-net: Fix receive buffer size
 calculation text

--0000000000009fb807060c61a2c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 8:44=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om>
wrote:

> On Fri, 10 Nov 2023 14:40:39 +0200, Parav Pandit <parav@nvidia.com> wrote=
:
> > Receive buffer size calculation is based on the following
> > negotiated features.
> >
> > The text has wrong calculation for IPv6 and also it has missed
> > VIRTIO_NET_F_HASH_REPORT.
> >
> > The problem of igorance of VIRTIO_NET_F_HASH_REPORT is reported
> > in [1], however fix for ipv6 payload length must also be
> > considered.
> >
> > Since for the both the fixes touching same requirements, a
> > new issue is created as [2].
> >
> > This patch brings following fixes.
> >
> > 1. Fix annotating struct virtio_net_hdr as field
> > 2. Fix receive buffer calculation for guest GSO cases to consider
> >    ipv6 payload length
> > 3. small grammar corrections for article
> > 4. reword the requirement to consider the virtio_ndr_hdr which is
> >    depends on the negotiated feature, hence first clarify the
> >    struct virtio_net_hdr size
> >
> > [1] https://github.com/oasis-tcs/virtio-spec/issues/170
> > [2] https://github.com/oasis-tcs/virtio-spec/issues/183
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/170
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  device-types/net/description.tex | 25 ++++++++++++++++++-------
> >  1 file changed, 18 insertions(+), 7 deletions(-)
> >
> > diff --git a/device-types/net/description.tex
> b/device-types/net/description.tex
> > index 96f7dc5..f5647d4 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -660,24 +660,35 @@ \subsubsection{Setting Up Receive
> Buffers}\label{sec:Device Types / Network Devi
> >  If the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> >  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_USO4 or
> VIRTIO_NET_F_GUEST_USO6
> >  features are used, the maximum incoming packet
> > -will be to 65550 bytes long (the maximum size of a
> > -TCP or UDP packet, plus the 14 byte ethernet header), otherwise
> > -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
> > -making for 65562 or 1526 bytes.
> > +will of size 65589 bytes long (14 bytes of Ethernet header, plus 40
> bytes of
> > +the IPv6 header, plus 65535 bytes of maximum IPv6 payload including an=
y
> > +extension header) otherwise 1514 bytes.
> > +When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive
> buffer
> > +size is either 65601 or 1526 bytes.
> > +When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buff=
er
> > +size is either 65609 or 1534 bytes.
> >
> >  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types =
/
> Network Device / Device Operation / Setting Up Receive Buffers}
> >
> > +If VIRTIO_NET_F_HASH_REPORT is not negotiated, the size of the field
> > +\field{struct virtio_net_hdr} is 12 bytes.
> > +
> > +If VIRTIO_NET_F_HASH_REPORT is negotiated, the size of the field
> > +\field{struct virtio_net_hdr} is 20 bytes.
>
> For the receive side, is these needed?
>
> Other is ok to me.
>
> Thanks
>
>
At the moment the virtio_net header size is equal for RX and TX
So, if the  VIRTIO_NET_F_HASH_REPORT is negotiated the header size will be
20 bytes for both directions..
In TX direction the extra space is the header is currently not used (if I'm
not mistaken).


>
> > +
> >  \begin{itemize}
> >  \item If VIRTIO_NET_F_MRG_RXBUF is not negotiated:
> >    \begin{itemize}
> >      \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> VIRTIO_NET_F_GUEST_UFO,
> >       VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated=
,
> the driver SHOULD populate
> > -      the receive queue(s) with buffers of at least 65562 bytes.
> > +      the receive queue(s) with buffers of at least 65589 bytes plus
> the size
> > +      of the \field{struct virtio_net_hdr}.
> >      \item Otherwise, the driver SHOULD populate the receive queue(s)
> > -      with buffers of at least 1526 bytes.
> > +      with buffers of at least 1514 bytes plus the size of the
> > +      \field{struct virtio_net_hdr}.
> >    \end{itemize}
> >  \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
> > -least the size of the struct virtio_net_hdr.
> > +least the size of the \field{struct virtio_net_hdr}.
> >  \end{itemize}
> >
> >  \begin{note}
> > --
> > 2.34.1
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

--0000000000009fb807060c61a2c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 13, 2023 at 8:44=E2=80=AF=
AM Xuan Zhuo &lt;<a href=3D"mailto:xuanzhuo@linux.alibaba.com">xuanzhuo@lin=
ux.alibaba.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Fri, 10 Nov 2023 14:40:39 +0200, Parav Pandit &lt;<a href=
=3D"mailto:parav@nvidia.com" target=3D"_blank">parav@nvidia.com</a>&gt; wro=
te:<br>
&gt; Receive buffer size calculation is based on the following<br>
&gt; negotiated features.<br>
&gt;<br>
&gt; The text has wrong calculation for IPv6 and also it has missed<br>
&gt; VIRTIO_NET_F_HASH_REPORT.<br>
&gt;<br>
&gt; The problem of igorance of VIRTIO_NET_F_HASH_REPORT is reported<br>
&gt; in [1], however fix for ipv6 payload length must also be<br>
&gt; considered.<br>
&gt;<br>
&gt; Since for the both the fixes touching same requirements, a<br>
&gt; new issue is created as [2].<br>
&gt;<br>
&gt; This patch brings following fixes.<br>
&gt;<br>
&gt; 1. Fix annotating struct virtio_net_hdr as field<br>
&gt; 2. Fix receive buffer calculation for guest GSO cases to consider<br>
&gt;=C2=A0 =C2=A0 ipv6 payload length<br>
&gt; 3. small grammar corrections for article<br>
&gt; 4. reword the requirement to consider the virtio_ndr_hdr which is<br>
&gt;=C2=A0 =C2=A0 depends on the negotiated feature, hence first clarify th=
e<br>
&gt;=C2=A0 =C2=A0 struct virtio_net_hdr size<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/oasis-tcs/virtio-spec/issues/170" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/oasis-tcs/virtio-spec=
/issues/170</a><br>
&gt; [2] <a href=3D"https://github.com/oasis-tcs/virtio-spec/issues/183" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/oasis-tcs/virtio-spec=
/issues/183</a><br>
&gt;<br>
&gt; Fixes: <a href=3D"https://github.com/oasis-tcs/virtio-spec/issues/170"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/oasis-tcs/virtio-s=
pec/issues/170</a><br>
&gt; Fixes: <a href=3D"https://github.com/oasis-tcs/virtio-spec/issues/183"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/oasis-tcs/virtio-s=
pec/issues/183</a><br>
&gt; Signed-off-by: Parav Pandit &lt;<a href=3D"mailto:parav@nvidia.com" ta=
rget=3D"_blank">parav@nvidia.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 device-types/net/description.tex | 25 ++++++++++++++++++-------<=
br>
&gt;=C2=A0 1 file changed, 18 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/device-types/net/description.tex b/device-types/net/descr=
iption.tex<br>
&gt; index 96f7dc5..f5647d4 100644<br>
&gt; --- a/device-types/net/description.tex<br>
&gt; +++ b/device-types/net/description.tex<br>
&gt; @@ -660,24 +660,35 @@ \subsubsection{Setting Up Receive Buffers}\label=
{sec:Device Types / Network Devi<br>
&gt;=C2=A0 If the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,<br>
&gt;=C2=A0 VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_=
GUEST_USO6<br>
&gt;=C2=A0 features are used, the maximum incoming packet<br>
&gt; -will be to 65550 bytes long (the maximum size of a<br>
&gt; -TCP or UDP packet, plus the 14 byte ethernet header), otherwise<br>
&gt; -1514 bytes.=C2=A0 The 12-byte struct virtio_net_hdr is prepended to t=
his,<br>
&gt; -making for 65562 or 1526 bytes.<br>
&gt; +will of size 65589 bytes long (14 bytes of Ethernet header, plus 40 b=
ytes of<br>
&gt; +the IPv6 header, plus 65535 bytes of maximum IPv6 payload including a=
ny<br>
&gt; +extension header) otherwise 1514 bytes.<br>
&gt; +When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive=
 buffer<br>
&gt; +size is either 65601 or 1526 bytes.<br>
&gt; +When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buf=
fer<br>
&gt; +size is either 65609 or 1534 bytes.<br>
&gt;<br>
&gt;=C2=A0 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device =
Types / Network Device / Device Operation / Setting Up Receive Buffers}<br>
&gt;<br>
&gt; +If VIRTIO_NET_F_HASH_REPORT is not negotiated, the size of the field<=
br>
&gt; +\field{struct virtio_net_hdr} is 12 bytes.<br>
&gt; +<br>
&gt; +If VIRTIO_NET_F_HASH_REPORT is negotiated, the size of the field<br>
&gt; +\field{struct virtio_net_hdr} is 20 bytes.<br>
<br>
For the receive side, is these needed?<br>
<br>
Other is ok to me.<br>
<br>
Thanks<br>
<br></blockquote><div><br></div><div>At the moment the virtio_net header si=
ze is equal for RX and TX</div><div>So, if the=C2=A0

VIRTIO_NET_F_HASH_REPORT is negotiated the header size will be 20 bytes for=
 both directions..=C2=A0=C2=A0</div><div>In TX direction the extra space is=
 the header is currently not used (if I&#39;m not mistaken).</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt;=C2=A0 \begin{itemize}<br>
&gt;=C2=A0 \item If VIRTIO_NET_F_MRG_RXBUF is not negotiated:<br>
&gt;=C2=A0 =C2=A0 \begin{itemize}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUE=
ST_TSO6, VIRTIO_NET_F_GUEST_UFO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUES=
T_USO6 are negotiated, the driver SHOULD populate<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 the receive queue(s) with buffers of at least 65=
562 bytes.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 the receive queue(s) with buffers of at least 65=
589 bytes plus the size<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 of the \field{struct virtio_net_hdr}.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 \item Otherwise, the driver SHOULD populate the re=
ceive queue(s)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 with buffers of at least 1526 bytes.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 with buffers of at least 1514 bytes plus the siz=
e of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 \field{struct virtio_net_hdr}.<br>
&gt;=C2=A0 =C2=A0 \end{itemize}<br>
&gt;=C2=A0 \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST =
be at<br>
&gt; -least the size of the struct virtio_net_hdr.<br>
&gt; +least the size of the \field{struct virtio_net_hdr}.<br>
&gt;=C2=A0 \end{itemize}<br>
&gt;<br>
&gt;=C2=A0 \begin{note}<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; This publicly archived list offers a means to provide input to the<br>
&gt; OASIS Virtual I/O Device (VIRTIO) TC.<br>
&gt;<br>
&gt; In order to verify user consent to the Feedback License terms and<br>
&gt; to minimize spam in the list archive, subscription is required<br>
&gt; before posting.<br>
&gt;<br>
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
&gt;<br>
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
</blockquote></div></div>

--0000000000009fb807060c61a2c6--
