Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4F94315E
	for <virtio-comment@lists.linux.dev>; Mon, 17 Mar 2025 01:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742175177; cv=none; b=Kmf9w2c/naZg3IlnKv54kXds1DlppbdWNQ+5I98stGj469OAlPbz8hUj5likoqujmjs9uKFU9jU5YDpBsTJjE72vtbTtsNyNmzdTmmmPueh/EWltF5dBz1m/xyxq/hyr3SXEv/v0m5Q0l3Usa7s36sb6ci0/Trg7haS0Kik2CdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742175177; c=relaxed/simple;
	bh=OpiNawAP43+fpH2faeBAHsCMsiPJpXsnKsg0MZSbWMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzid2PBvrcihbBLUhRlHYokZpDxO2/5XUiDUcbpOgzSJ7csAktaddBPeTRC2ZIMeS6Wb8tWxzPsE51ACGU5BsHs7eynKNf1/+U7cOg2hxkRa7YQM6Bj2AdSbs+a3DB+t/mn7vY+v62wmayZwiyUnJJLCme/xFCbVhlNB++0fUVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NHfZ9CGA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NHfZ9CGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742175174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9TnRxaMigBouinepRcezdQtzNpKYe3o6t8juZCQpV4=;
	b=NHfZ9CGAtQfQpfYhg6T46WjGw2V6D6Dd9TDx7RnJ3KeDZM9xlehFMVV6SezF1lzZlg5tMT
	zasdFKcJItLtn5mgqBmIP/6y8ai9EUSjBoXKIyKR+yw9lrXSS4AmwuY5sBURw9rWs3Xomm
	4gXK9wpqaTjeANPMU1p/IHZosUq5sX8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-tlmcrfTzMJmeY64Ge0wfFQ-1; Sun, 16 Mar 2025 21:32:53 -0400
X-MC-Unique: tlmcrfTzMJmeY64Ge0wfFQ-1
X-Mimecast-MFC-AGG-ID: tlmcrfTzMJmeY64Ge0wfFQ_1742175172
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff8a2c7912so2147671a91.1
        for <virtio-comment@lists.linux.dev>; Sun, 16 Mar 2025 18:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742175172; x=1742779972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9TnRxaMigBouinepRcezdQtzNpKYe3o6t8juZCQpV4=;
        b=hCSkmjcehkTB+3JfqEGxTwL0TDF35IDD4uqOxKLVvIVYOUosDVEowpZGQRePS8lDns
         w17Xv1XPPCWQe38QN40FBPlBwhziwhslY2wERno4tVq72Thr22UZEegRYn4xoBqsDqrM
         lqkkDtir9heOUCWF20yvdhKfc9g0JgdvEo5Qld1UgZ+t8j+4aXr3BFrzM1FXuzOYI9l2
         XRUodUj3rhuAj33bk6RPwWLLAw7fHi5yDPNa89Y/j+anTF3famt/yxMn/SzMxc6VU+vk
         PjL6v4qgda9tO0JL2VgAtIl101iLkabZq+6dEtXJQ0EJz4GRFv/HQr2lEYsQytnEXjpF
         8Stg==
X-Forwarded-Encrypted: i=1; AJvYcCWyFUA8Jn2DkMBLH8KsGQuY7XLgp5EN80mK4EbuydzJBYl68Mtwf1a9WfdvOeMNemdD/RFUTvbEAVoVxJZV/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqq5zoAfW8N/IzZ7K4cZhhp9a6cx35i7hh/BMtHxHr8yAyLXnA
	SOn/1EaSO/2sS9DVwNWynPIt/PNRAAektr2Q/ypsYsaPfNrmhwZTLDiqiDpziz3JLBrJMMK004t
	EBhtRKb0OijlmaIV2Nm1NgzHWYLIUbiffPjUX24C8U1IJcTK1HZKlXcJ/le8aaxMvHiKExIu3lp
	3l0W9OuAXrtCjtkVRP3iwRloFyHAtbZiNowfx9FRo=
X-Gm-Gg: ASbGncuZ/EvtmtzyXhb9yG9FdXPKO1O6hjlPhaOkJhM7F3U4TvPPISLyHF1qyU8k4zu
	YKW/Ew2Hex5/CyN3++RjYY/A5XGDAF2epH1I3ZKbtOy9asx0wGGBCuC3fXk7hVxe+sYqIfAyUNg
	==
X-Received: by 2002:a17:90b:2e4f:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-3015211e139mr13296000a91.2.1742175172244;
        Sun, 16 Mar 2025 18:32:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH584rxbIQ8GzgH+9O/WJQIf7KB/E2xAovilpqhSf7XcZ2e5qe/Y0kxqCrNT7Y+Nij55w8H59k3+SFyDr+mmJg=
X-Received: by 2002:a17:90b:2e4f:b0:2fa:17e4:b1cf with SMTP id
 98e67ed59e1d1-3015211e139mr13295958a91.2.1742175171850; Sun, 16 Mar 2025
 18:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306171917.90460-1-chia-yu.chang@nokia-bell-labs.com>
 <20250306171917.90460-2-chia-yu.chang@nokia-bell-labs.com>
 <CACGkMEtzRUj2-W8x1GG9qnRHisNHT2aVtnXWnb7XmY3gr9BsxQ@mail.gmail.com>
 <AM6PR07MB44568AE19E5B79E851EEC498B9D12@AM6PR07MB4456.eurprd07.prod.outlook.com>
 <CACGkMEty=UQfgVLGBmLqp=R5chCtrGenE3Vf8tuPaYN+ZR7boA@mail.gmail.com> <PAXPR07MB79848015722ABFA41461DC3AA3DC2@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To: <PAXPR07MB79848015722ABFA41461DC3AA3DC2@PAXPR07MB7984.eurprd07.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 17 Mar 2025 09:32:40 +0800
X-Gm-Features: AQ5f1JoCDSEcACuta1GIIhaGgms6NP20iga0_6Z8-JRso9FIxTbn79kWCGbk-3Q
Message-ID: <CACGkMEv2VQA6E6JjmC4jf+oHK9np_+FJzJ_5i4Td51FCYu+iPA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] virtio-net: Fix ECN feature descritpion
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
Cc: "Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>, 
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>, 
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com" <ncardwell@google.com>, "g.white" <g.white@cablelabs.com>, 
	"vidhi_goel@apple.com" <vidhi_goel@apple.com>, 
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>, 
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JAgZw6iLxSpJ8fb4lsnCPdDL7MRffBYX28qsCCkbkbk_1742175172
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 12:18=E2=80=AFAM Chia-Yu Chang (Nokia)
<chia-yu.chang@nokia-bell-labs.com> wrote:
>
> > Please see below.
> >
> > On Tue, Mar 11, 2025 at 9:58=E2=80=AFPM Koen De Schepper (Nokia) <koen.=
de_schepper@nokia-bell-labs.com> wrote:
> > >
> > > Hi Jason,
> > >
> > > Referring to the RFC only is a bit overwhelming for a small but very =
important detail. I think in this case we need to point specifically to tha=
t small detail in the RFC which is otherwise lost by an implementer trying =
to find out what this option should do. On the other hand, the text can be =
shortened maybe:
> > >
> > >     indicates that a TCP CWR flag of an aggregated segment needs to b=
e applied to the 1st segment only and be cleared on following segments,
> > >     in compliance with RFC 3168\footnote{This case is not handled by =
some older hardware, so is called out specifically in the protocol.}.
> > >
> > > Same level of detail, clarity and brevity should/can be used for the =
Accurate ECN flag.
> > > Would that be acceptable for you?
> >
> > So this goes back to my question previously: Is this too late to clarif=
y the behaviour of virtio-net ECN feature (as you said "This case is not ha=
ndled by some older hardware")? If not, I still think it would be risky and=
 not necessary to repeat the RFC details here:
> >
> > 1) It looks like the GSO requirement is not explicit described in the R=
FC 3168, so if it's need to be inferred from that RFC, it's probably not th=
e charge of virtio spec.
> > 2) If GSO requirement is clear in the RFC 3168, there's no need to repe=
at it again
> >
> > I understand that the CWR behaviour you described here is the behaviour=
 of the Linux software segmentation offload but I'm not sure we can audit a=
ll the implementation of virtio. A more easy way is to leave the ECN in the=
 spec as is so we can focus on the new feature for ACCECN.
> >
> > But we can hear from others for sure.
> >
> > Thanks
>
> Per my understanding, even the current ECN in the virtio spec is incorrec=
t: "The driver SHOULD NOT send to the device TCP packets requiring segmenta=
tion offload which have the Explicit Congestion Notification bit set, unles=
s the VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case th driver =
MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}."
> So, we need this change before AccECN patch.
>
> Per my understanding, RFC3168 says "When the TCP data sender is ready to =
set the CWR bit after reducing the congestion window, it SHOULD set the CWR=
 bit only on the first new data packet that it transmits."
> And IMO it can be inferred that only the 1st segment will retain CWR (but=
 not other segments) - but RFC3168 did NOT explicitly says it's related to =
GSO.
> Maybe we can say like "...indicates that the CWR flag of individual segme=
nts in the aggregated segment is handled differently and is incompliance wi=
th RFC3168 ECN requirements in [REF] ..."
> Does it look better for you?

I'm not sure I get this. Is the above for describing the ACCECN
feature? For ACCECN, it has a charpeter to describe GSO so personally,
I still prefer not to mention it here.

But we can hear from others.

Thanks


>
> Chia-Yu
>
> >
> > >
> > > Regards,
> > > Koen.
> > >
> > >
> > > -----Original Message-----
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Monday, March 10, 2025 3:21 AM
> > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > Cc: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com=
;
> > > mvaralar@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com;
> > > ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia)
> > > <koen.de_schepper@nokia-bell-labs.com>; g.white
> > > <g.white@cablelabs.com>; vidhi_goel@apple.com;
> > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > Subject: Re: [PATCH v5 1/2] virtio-net: Fix ECN feature descritpion
> > >
> > >
> > > >    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature=
,
> > > >      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> > > > -    indicates that the TCP packet has the ECN bit set\footnote{Thi=
s case is not handled by some older hardware, so is called out
> > > > -specifically in the protocol.}.
> > > > +    indicates that the TCP packet has TCP CWR flag set and the fla=
g will be applied to the 1st segment of an
> > > > +    aggregated segment and be cleared from the 2nd segment of an a=
ggregated
> > > > +    segment\footnote{This case is not handled by some older hardwa=
re, so is called out specifically in the protocol.}.
> > > >     \end{itemize}
> > >
> > > Nit: I still prefer to just say this complies with RFC3168 without du=
plicating the implementation details.
> > >
> > > But if others are fine with this I'm also ok.
> > >
> > > Thanks
> > >
> > > >
> > > >  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O
> > > > feature and the @@ -788,10 +793,10 @@ \subsubsection{Packet
> > > > Transmission}\label{sec:Device Types / Network Device / De  \field{=
gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> > > >
> > > >  The driver SHOULD NOT send to the device TCP packets requiring
> > > > segmentation offload -which have the Explicit Congestion
> > > > Notification bit set, unless the -VIRTIO_NET_F_HOST_ECN feature is
> > > > negotiated, in which case the -driver MUST set the
> > > > VIRTIO_NET_HDR_GSO_ECN bit in -\field{gso_type}.
> > > > +which have the TCP CWR flag set and require the flag be applied to
> > > > +the 1st segment of an aggregated segment and be clared from the 2n=
d
> > > > +segment of an aggregated segment, unless the VIRTIO_NET_F_HOST_ECN
> > > > +feature is negotiated, in which case the driver MUST set the VIRTI=
O_NET_HDR_GSO_ECN bit in \field{gso_type}.
> > > >
> > > >  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY
> > > > set
> > > >  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> > > > VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1105,9 +1110,9 @@
> > > > \subsubsection{Processing of Incoming Packets}\label{sec:Device
> > > > Types / Network  \end{enumerate}
> > > >
> > > >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> > > > -and ECN features enable receive checksum, large receive offload an=
d
> > > > ECN -support which are the input equivalents of the transmit
> > > > checksum, -transmit segmentation offloading and ECN features, as
> > > > described
> > > > +and ECN features enable receive checksum, large receive offload an=
d
> > > > +RFC3168 ECN support which are the input equivalents of the transmi=
t
> > > > +checksum, transmit segmentation offloading and RFC3168 ECN
> > > > +features, as described
> > > >  in \ref{sec:Device Types / Network Device / Device Operation /
> > > > Packet Transmission}:
> > > >  \begin{enumerate}
> > > > @@ -1210,10 +1215,10 @@ \subsubsection{Processing of Incoming
> > > > Packets}\label{sec:Device Types / Network  the VIRTIO_NET_HDR_F_UDP=
_TUNNEL_CSUM bit in \field{flags}.
> > > >
> > > >  The device SHOULD NOT send to the driver TCP packets requiring
> > > > segmentation offload -which have the Explicit Congestion
> > > > Notification bit set, unless the -VIRTIO_NET_F_GUEST_ECN feature is
> > > > negotiated, in which case the -device MUST set the
> > > > VIRTIO_NET_HDR_GSO_ECN bit in -\field{gso_type}.
> > > > +which have the TCP CWR flag set and require the flag be applied to
> > > > +the 1st segment of an aggregated segment and be cleared from the
> > > > +2nd segment of an aggregated segment, unless the
> > > > +VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the de=
vice MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> > > >
> > > >  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
> > > > device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in diff --git
> > > > a/introduction.tex b/introduction.tex index e60298a..d52622e 100644
> > > > --- a/introduction.tex
> > > > +++ b/introduction.tex
> > > > @@ -168,6 +168,9 @@ \section{Normative References}\label{sec:Normat=
ive References}
> > > >      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Ke=
y Words", BCP
> > > >      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> > > >          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> > > > +       \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> > > > +    S. Floyd., ``The Addition of Explicit Congestion Notification =
(ECN) to IP'', September 2001.
> > > > +       \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
> > > >  \end{longtable}
> > > >
> > > >  \section{Non-Normative References}
> > > > --
> > > > 2.34.1
> > > >
> > >

