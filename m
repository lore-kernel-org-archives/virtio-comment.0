Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91A7146585
	for <virtio-comment@lists.linux.dev>; Wed, 12 Mar 2025 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741742295; cv=none; b=jMhFpJW0pQXmqY99GJ3f51HMmopytDuoFGG6+WAfx+DXCkJdL+CsDvGbKagZKO1oEBiZMa/ZAFVJd7EbH2Ht6s44DbCh+thTbv59UgDAtyrzEbCxr9Q6RrV1n/tn4MlEKfUfw5fLvcyOiQioHbUKdKhXy4H9tt23ZAmUB/sjmy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741742295; c=relaxed/simple;
	bh=7eC/x48kbUPeNYfRR2CYI6Nq7BZ0O2vc754P9EFiX3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NW+wH7OguAEMhnfLQ3h0ov28nt5bcLi8nk8Y6xY+lKArlYDxaoPy6gtwcufzB5Mjyo9atz60ktmEfVXu/KRL4fCU0n+4yeaPBVRho88k/akKDgAduHNHAtecoj17DQJJ2uLYvYGgbymHa8LSaFAXf3kWwowSwapoONg73dpZ5E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWKoDiAb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWKoDiAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741742292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kj2zGAZL/KaR2uQVBRICjJSHEppTc7zQX1kdjpo4qXQ=;
	b=EWKoDiAbr1rvey5r+is3mgGekw3Gf7x9fn/oFi2em99NvfvJxY5KmOEyHD4uAzOXylgpN9
	JT2RhTTFXkGvB6OrQbbUcwE/MTfL/Btj9E99r89o9KtfiHhHNeHHmhabuMgx9h0OFH63j2
	kVIUy3QhTZqXStXubTAFbn45hN+uagQ=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-eRJiPrsKPPa5C3eqLi518w-1; Tue, 11 Mar 2025 21:18:11 -0400
X-MC-Unique: eRJiPrsKPPa5C3eqLi518w-1
X-Mimecast-MFC-AGG-ID: eRJiPrsKPPa5C3eqLi518w_1741742290
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-86d3f4d0496so710607241.1
        for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 18:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741742290; x=1742347090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kj2zGAZL/KaR2uQVBRICjJSHEppTc7zQX1kdjpo4qXQ=;
        b=NZhJc/jaN3vjjw3FbwBV/sG11VTnJoJ/FzNDlaaIMcysPYhUnx0fZwm2OBola8poID
         1joRlBJZRDBxTT02WzkmHSqiU2fPtWET5qGePpqa4HGMvWBC/1v8tAEK5kVFE6GIw7qb
         iszxiyyVjEowSPCPIFdnc4zQXsE6GVlC1LyYP0fHyPhu832SbVMMjy+k+gtv0/WRsZGp
         4uksq2NzNzpg5NXLjmjQ0mF2Ohzwpy4Z9ENPu0RBIepOTJgIEkAMrECkcChR36V+h8KQ
         rXKd5dKppM2hPlKswo4uwQ43Efyns3aKfuahfMafV1xe2n1QRXJSq+DCUqo+ZQ9uJIlD
         CD3A==
X-Forwarded-Encrypted: i=1; AJvYcCVD2dBI5RWBtkaTTKjOuxnIuwqcxUvwHnLkuslIw5kubk/BW29MzjC2bAoMIy7k5bUM+6GAmNf39JwSN7ol/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzE9Vg9wDVLMAE3cUbhDTztW5VemyRyBBphT7i6sdrBF2IK58YR
	G8ZoKkUTf0RbwaeXaRzJn/9/Q1XFk39v8+MRmalKTCWo0Mg5eiJxWFipfYEwFOD8+mY5iqfY+v7
	I7zEDqHA5OEmj8Xnzz59qCG/DwDs07oiK+1jtTNt6BZzVL+6gJN1l59PxlSbCP92gV1rwfpjdfo
	AYEVwXU9jey/HR3uhWBFUdstz3Z+pQah8qITnC4zA=
X-Gm-Gg: ASbGncu3TVvFBjzZxcYzoryqzGG+eRxMcRk+0UD18mwIBNSHN+alFxY/s7MgqQ5hRcE
	Q9rTTMOpVLkKFiiTAlmQw0xgq0xI2WTGu9IsIhp8IRv2kPMqMidQO+2Ge0oSN1+2RbkEpTQ==
X-Received: by 2002:a05:6102:2d09:b0:4c1:774b:3f7a with SMTP id ada2fe7eead31-4c30a6c77b2mr13758371137.16.1741742290649;
        Tue, 11 Mar 2025 18:18:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUz0t3wg/wMVU1/4/CpBDcA1QZvr1A4F86wh4u8UuZUJr+PvAViMZPxWYyaAXUWHukmULb0Wzi+QpQFdVScX4=
X-Received: by 2002:a05:6102:2d09:b0:4c1:774b:3f7a with SMTP id
 ada2fe7eead31-4c30a6c77b2mr13758355137.16.1741742290304; Tue, 11 Mar 2025
 18:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306171917.90460-1-chia-yu.chang@nokia-bell-labs.com>
 <20250306171917.90460-2-chia-yu.chang@nokia-bell-labs.com>
 <CACGkMEtzRUj2-W8x1GG9qnRHisNHT2aVtnXWnb7XmY3gr9BsxQ@mail.gmail.com> <AM6PR07MB44568AE19E5B79E851EEC498B9D12@AM6PR07MB4456.eurprd07.prod.outlook.com>
In-Reply-To: <AM6PR07MB44568AE19E5B79E851EEC498B9D12@AM6PR07MB4456.eurprd07.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Mar 2025 09:17:56 +0800
X-Gm-Features: AQ5f1Jo7tWmMClECJQw5jLG3rBfcnCIS7zwG-rZ0gjXS-oJY5u9gxNoa-IS99uk
Message-ID: <CACGkMEty=UQfgVLGBmLqp=R5chCtrGenE3Vf8tuPaYN+ZR7boA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] virtio-net: Fix ECN feature descritpion
To: "Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>
Cc: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>, 
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>, 
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com" <ncardwell@google.com>, "g.white" <g.white@cablelabs.com>, 
	"vidhi_goel@apple.com" <vidhi_goel@apple.com>, 
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>, 
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b23-dvZPxlURoJUBAbPXgzy5RvV0ZM76iwRypiTHNFI_1741742290
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 9:58=E2=80=AFPM Koen De Schepper (Nokia)
<koen.de_schepper@nokia-bell-labs.com> wrote:
>
> Hi Jason,
>
> Referring to the RFC only is a bit overwhelming for a small but very impo=
rtant detail. I think in this case we need to point specifically to that sm=
all detail in the RFC which is otherwise lost by an implementer trying to f=
ind out what this option should do. On the other hand, the text can be shor=
tened maybe:
>
>     indicates that a TCP CWR flag of an aggregated segment needs to be ap=
plied to the 1st segment only and be cleared on following segments,
>     in compliance with RFC 3168\footnote{This case is not handled by some=
 older hardware, so is called out specifically in the protocol.}.
>
> Same level of detail, clarity and brevity should/can be used for the Accu=
rate ECN flag.
> Would that be acceptable for you?

So this goes back to my question previously: Is this too late to
clarify the behaviour of virtio-net ECN feature (as you said "This
case is not handled by some older hardware")? If not, I still think it
would be risky and not necessary to repeat the RFC details here:

1) It looks like the GSO requirement is not explicit described in the
RFC 3168, so if it's need to be inferred from that RFC, it's probably
not the charge of virtio spec.
2) If GSO requirement is clear in the RFC 3168, there's no need to
repeat it again

I understand that the CWR behaviour you described here is the
behaviour of the Linux software segmentation offload but I'm not sure
we can audit all the implementation of virtio. A more easy way is to
leave the ECN in the spec as is so we can focus on the new feature for
ACCECN.

But we can hear from others for sure.

Thanks

>
> Regards,
> Koen.
>
>
> -----Original Message-----
> From: Jason Wang <jasowang@redhat.com>
> Sent: Monday, March 10, 2025 3:21 AM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Cc: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mv=
aralar@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kern=
el.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepper@no=
kia-bell-labs.com>; g.white <g.white@cablelabs.com>; vidhi_goel@apple.com; =
ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> Subject: Re: [PATCH v5 1/2] virtio-net: Fix ECN feature descritpion
>
>
> >    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
> >      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> > -    indicates that the TCP packet has the ECN bit set\footnote{This ca=
se is not handled by some older hardware, so is called out
> > -specifically in the protocol.}.
> > +    indicates that the TCP packet has TCP CWR flag set and the flag wi=
ll be applied to the 1st segment of an
> > +    aggregated segment and be cleared from the 2nd segment of an aggre=
gated
> > +    segment\footnote{This case is not handled by some older hardware, =
so is called out specifically in the protocol.}.
> >     \end{itemize}
>
> Nit: I still prefer to just say this complies with RFC3168 without duplic=
ating the implementation details.
>
> But if others are fine with this I'm also ok.
>
> Thanks
>
> >
> >  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
> > feature and the @@ -788,10 +793,10 @@ \subsubsection{Packet
> > Transmission}\label{sec:Device Types / Network Device / De  \field{gso_=
type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> >
> >  The driver SHOULD NOT send to the device TCP packets requiring
> > segmentation offload -which have the Explicit Congestion Notification
> > bit set, unless the -VIRTIO_NET_F_HOST_ECN feature is negotiated, in
> > which case the -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> > -\field{gso_type}.
> > +which have the TCP CWR flag set and require the flag be applied to
> > +the 1st segment of an aggregated segment and be clared from the 2nd
> > +segment of an aggregated segment, unless the VIRTIO_NET_F_HOST_ECN
> > +feature is negotiated, in which case the driver MUST set the VIRTIO_NE=
T_HDR_GSO_ECN bit in \field{gso_type}.
> >
> >  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
> >  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> > VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1105,9 +1110,9 @@
> > \subsubsection{Processing of Incoming Packets}\label{sec:Device Types
> > / Network  \end{enumerate}
> >
> >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> > -and ECN features enable receive checksum, large receive offload and
> > ECN -support which are the input equivalents of the transmit checksum,
> > -transmit segmentation offloading and ECN features, as described
> > +and ECN features enable receive checksum, large receive offload and
> > +RFC3168 ECN support which are the input equivalents of the transmit
> > +checksum, transmit segmentation offloading and RFC3168 ECN features,
> > +as described
> >  in \ref{sec:Device Types / Network Device / Device Operation /
> > Packet Transmission}:
> >  \begin{enumerate}
> > @@ -1210,10 +1215,10 @@ \subsubsection{Processing of Incoming
> > Packets}\label{sec:Device Types / Network  the VIRTIO_NET_HDR_F_UDP_TUN=
NEL_CSUM bit in \field{flags}.
> >
> >  The device SHOULD NOT send to the driver TCP packets requiring
> > segmentation offload -which have the Explicit Congestion Notification
> > bit set, unless the -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in
> > which case the -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> > -\field{gso_type}.
> > +which have the TCP CWR flag set and require the flag be applied to
> > +the 1st segment of an aggregated segment and be cleared from the 2nd
> > +segment of an aggregated segment, unless the VIRTIO_NET_F_GUEST_ECN
> > +feature is negotiated, in which case the device MUST set the VIRTIO_NE=
T_HDR_GSO_ECN bit in \field{gso_type}.
> >
> >  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
> > device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in diff --git
> > a/introduction.tex b/introduction.tex index e60298a..d52622e 100644
> > --- a/introduction.tex
> > +++ b/introduction.tex
> > @@ -168,6 +168,9 @@ \section{Normative References}\label{sec:Normative =
References}
> >      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Wo=
rds", BCP
> >      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> >          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> > +       \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> > +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN=
) to IP'', September 2001.
> > +       \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
> >  \end{longtable}
> >
> >  \section{Non-Normative References}
> > --
> > 2.34.1
> >
>

