Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0375F20334
	for <virtio-comment@lists.linux.dev>; Thu, 10 Oct 2024 04:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728534162; cv=none; b=MvfwBMa0TYt+ljdN+nD5H+QtQI1YjWaUptJap4LvBl74bIBDIk/78tV0yG9LZuEKCBUbO6363whpCyeFHPYF0TqcEY3WlzOVEodihdGJGTBgiVuvnY1cuoLcSVdA5iT+CmHifTbHH027EHZMDvcocwMnIiP1GVnUlLrOqgVkswA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728534162; c=relaxed/simple;
	bh=Sl7xWsEpPTce2qXzRhQd2TG020dHtOZwBjeYWOcjQ+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sfcWxDikdGlpWhj04IYNfZKGptLZcm2vmQIMraSmeOi/M0hXCfrJGjRhROPK8Fdw2wxo/5e/9WNhUG/DFEpF2j80iV16Hd/F7rfVJqxAl2Zjgbl3uyTgrTvzx+mlataVT5J9uX+yuQKKYTBDNrECKTf/St3Zbm/DLCIQX8oQ+9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hze6rlie; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hze6rlie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728534157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0otmT+kiBVwbh6LANMzHkv0Sw1xcfh8YzYwffdCa9U=;
	b=hze6rlieSxFfw0T25LuPTDRncHccMg/9DEtxRrVhgARqyQXflrCeKgMRnTBjAhAj4450Uk
	K2m3c9S9WIp/W1I4kkuKxu4YoMtVsQ7YTNuPvySSxGxSyt3SjdFVIVTBcnJq2COVI9w70o
	XHtZSydNux3Tx/WX3rodQ0FbSYdzIm8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-zDY9Nq1RMoWMJrY3uRjOVw-1; Thu, 10 Oct 2024 00:22:33 -0400
X-MC-Unique: zDY9Nq1RMoWMJrY3uRjOVw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2e148d4550bso637482a91.1
        for <virtio-comment@lists.linux.dev>; Wed, 09 Oct 2024 21:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728534152; x=1729138952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0otmT+kiBVwbh6LANMzHkv0Sw1xcfh8YzYwffdCa9U=;
        b=WlWJPw8mRZ/FF9wCP2Bnc9c7cFi96umSipcwSTx9j9Ma7C4QvaiYwLIwyohXnvPhqP
         NBaUlzo/v0/g/zA1Vwh2NP84v4taVT5AzKLfOBwzBlbevpAGUQqdjadmfO/TlxoyjC9W
         RfSCLPgOyH+J1F0pHQyipeLDGcn/AHOWkUbB6rrxw0hJrpGtan+tMneuyC+FU/bxIK0i
         wDL+pmHlSFQsqmZ9myzMTPZTRbQ8W4taDDdvrS7QUDnmYIn7BsvP1asvwH6dXw34i4iQ
         vXPpRdttGgaxLvgI8SiONJ1awyQL0de2Au/ICpitYkWGO+kCgCsDjQhxR8jTgem45QBE
         B6dA==
X-Gm-Message-State: AOJu0YzE5W1RXMDNimLRe8ZdcGONl6eyiOw3tD+5Q2tww9RweN7UzSE+
	zwAArufXF99AeFKM/7jEmzoYAbFviGmwt10L15PWpZ/XLNgZJM0Xn8kyKuwCQ4kW4QGdIO+krpp
	2xgwTDGdNDQ6Wwsof7PLdVpdzfL1VjwzJ5LmQzU/qq73nZmyTWr9+9fCdOrCwqVklexBiaYv32u
	OHCRPra9kibeQXao2Hw30KHQJZbdCorNWojspdEiY=
X-Received: by 2002:a17:90b:4d88:b0:2e2:c00c:cb79 with SMTP id 98e67ed59e1d1-2e2c63046f8mr2633854a91.3.1728534152366;
        Wed, 09 Oct 2024 21:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGak+hpEE0Bo6aCyFbHYC/OPH9qcjtTvUWXuMFBRk5EDoZWW0w5Jut/vBtubSo0+L9GRAz1gy4Yzg3Aj+pn+UM=
X-Received: by 2002:a17:90b:4d88:b0:2e2:c00c:cb79 with SMTP id
 98e67ed59e1d1-2e2c63046f8mr2633830a91.3.1728534151807; Wed, 09 Oct 2024
 21:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <dd1f0e96d889daec3e53ffd21cbbd061aad8cb9a.1728029499.git.pabeni@redhat.com>
 <CACGkMEsP3uobKB1aM=9NFFbdH8nGBsdb86F=LkAJgxafoAuJTw@mail.gmail.com> <7e396509-f996-453b-baea-2e2ea0cf179d@redhat.com>
In-Reply-To: <7e396509-f996-453b-baea-2e2ea0cf179d@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Oct 2024 12:22:08 +0800
Message-ID: <CACGkMEtYrwUECV_=CNs1LmwEycDyXzhm-fEu1S8OoAKeK2UfFA@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] virtio-net: define UDP tunnel checksum offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 5:39=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/9/24 09:18, Jason Wang wrote:
> >> @@ -168,6 +176,13 @@ \subsubsection{Feature bit requirements}\label{se=
c:Device Types / Network Device
> >>   \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and VI=
RTIO_NET_F_RSS.
> >>   \end{description}
> >>
> >> +\begin{note}
> >> +The dependency between UDP_TUNNEL_GSO_CSUM and UDP_TUNNEL_GSO is inte=
ntionally
> >> +in the opposite direction with respect to the plain GSO features and =
the plain
> >> +checksum offload because UDP tunnel checksum offload gives very littl=
e gain
> >> +for non GSO packets and is quite complex to implement in H/W.
> >> +\end{note}
> >
> > Nit: maybe it's better to define "plain GSO" or just call it "non-tunne=
l GSO".
>
> I'll opt for "non-tunnel GSO".
> Note this section is not changed from the previous iteration.

Sorry if some questions were repeated, some of the context might be
forgotten during the switch.

>
> >> @@ -731,8 +782,23 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
> >>     to the inner transport header and inner transport checksum field.
> >>   \end{itemize}
> >>
> >> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature has been negotia=
ted,
> >> +and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
> >> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
> >> +the driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
> >> +\field{flags}, if so the driver MUST set the packet outer UDP header =
checksum
> >> +to the outer UDP pseudo header.
> >> +
> >> +\begin{note}
> >> +calculating a ones' complement checksum from \field{outer_th_offset}
> >> +up until the end of the packet and storing the result at offset 6
> >> +from \field{outer_th_offset} will result in a fully checksummed outer=
 UDP packet;
> >> +\end{note}
> >> +
> >>   If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> >> -VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, t=
he
> >> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set
> >> +and the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature has not
> >> +been negotiated, the
> >>   outer UDP header MUST NOT require checksum validation. That is, the
> >>   outer UDP checksum value MUST be 0 or the validated complete checksu=
m
> >>   for such header.
> >
> > Nit:  do we need to mention this is for TX?
>
> Note that this the '\drivernormative... Packet Transmission' section.
> With 'TX' I guess you refer to '\devicenormative... Processing of
> Incoming Packets'? It's already there:
>
> """
> Otherwise, the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been
> negotiated, either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit is set or t=
he
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is set in \field{gso_type},
> and the bit VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is not set in
> \field{flags}, the device MUST either provide a zero outer UDP header
> checksum or a fully checksummed outer UDP header.
> """

My bad, you are right.

>
> >> @@ -920,8 +995,11 @@ \subsubsection{Processing of Incoming Packets}\la=
bel{sec:Device Types / Network
> >>     in \field{flags}, meaning that the device validated the checksum,
> >>     set the csum_start and csum_offset fields, but did not provide the
> >>     partial checksum for the transport header.
> >> -  In case of multiple encapsulated protocols, one level of checksums
> >> -  has been validated.
> >> +  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been nego=
tiated,
> >> +  and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags=
},
> >> +  both the outer UDP checksum and the inner transport checksum
> >> +  have been validated,
> >
> > We may need to clarify this is for RX.
>
> I'm sorry, I'm still slightly confused by the 'RX' alone. This is in the
> '\devicenormative ... Setting Up Receive Buffers' section, do you mean
> the other direction?, that is '\drivernormative ... Processing of
> Incoming Packets'?
>
> Currently such section only prescribe 'MUST NOT' behavior (even for non
> tunnel GSO), such clarification does not seam to fit there?!?

You're right here.

>
> > What's more, this seems to be
> > the semantic of DATA_VALID? If yes, to be consistent, something like
> > VIRTIO_NET_HDR_F_UDP_TUNNEL_DATA_VALID might be better.
>
> The VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM bit just specify how many
> csums are validated by the driver (or the device).

I'm not sure I get the meaning of "how many csums" here.

>
> If DATA_VALID is set, this is checksum unnecessary. Otherwise is csum
> partial.

I think I'm a little bit confused about the usage here. Please see my
question in the previous patch, and it looks like it causes some
confusion.

For example, without this patch, NEEDS_CUSM needs to be set explicitly
but this patch switches to assume NEEDS_CSUM if !DATA_VALID?

> Its specificed a few lines above:
>
> """
> \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
>    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>    set: if so, device has validated the packet checksum.

Note that this part will be changed soon, see:

https://lore.kernel.org/all/1704263702-50528-1-git-send-email-hengqi@linux.=
alibaba.com/

(Note sure why it is not merged)

DATA_VALID (CHECKSUM_UNNECESSARY) should not depend on NEEDS_CUSM
(CHECKSUM_PARTAIL).

>    If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature has been negotiated,
>    and either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
>    VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
>    the device can additionally set the VIRTIO_NET_HDR_F_DATA_VALID bit
>    in \field{flags}, meaning that the device validated the checksum,
>    set the csum_start and csum_offset fields, but did not provide the
>    partial checksum for the transport header.
> """

And probably this part

"""
  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been negotiated=
,
  and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags},
  both the outer UDP checksum and the inner transport checksum
  have been validated, otherwise only one level of checksums (the inner one
  in case of tunnels) has been validated.
"""

I think the confusion came from the definition of "validated". I
thought it only worked for DATA_VALID (as I replied in patch 1).

Or you meant:

VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM | DATA_VALID: DATA_VALID for inner and out=
er
VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM: NEEDS_CSUM for both inner or outer

This excludes the combination of NEEDS_CUSM & DATA_VALID. It might be
worth explaining this in the cover letter. And the introduction of the
VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is to differ from the case where
outer checksum is not offload.

Anyhow, it's better to set NEEDS_CUSM explicitly to be consistent with
the non-tunnel GSO.

>
> > And is there a chance that we may need partial csum for outer UDP e.g
> > in the case of VM2VM communication.
>
> I feel like I'm missing something?!? AFAICS this is has been already
> discussed, agreed and set int spec. This specification allows for
> checksum partial for the outer header, in both direction
> (VIRTIO_NET_HDR_F_DATA_VALID not set and
> VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM set.
>
> >> @@ -957,6 +1035,14 @@ \subsubsection{Processing of Incoming Packets}\l=
abel{sec:Device Types / Network
> >>     bit MAY be set. In such case the \field{outer_th_offset} and
> >>     \field{inner_nh_offset} fields indicate the corresponding
> >>     headers information.
> >> +\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature was
> >> +negotiated, and
> >> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set in \field{gso_type}, t=
he
> >> +  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} can be se=
t: if so,
> >> +  the outer UDP checksum has been validated.
> >> +  If the VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} is not set,=
 the UDP
> >> +  header checksum at offset 6 from from \field{outer_th_offset}
> >> +  is set to the outer UDP pseudo header checksum.
> >
> > Just to confirm, VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is for outer and
> > VIRTIO_NET_HDR_F_DATA_VALID is for inner in this case?
>
> The VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit specify if the outer header has
> been validated: with !VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM only the inner
> header is validated, with VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM set, both the
> inner and the outer.
>
> The VIRTIO_NET_HDR_F_DATA_VALID specify if it's the packet is
> csum_partial (!VIRTIO_NET_HDR_F_DATA_VALID) or csum_unnecessary
> (VIRTIO_NET_HDR_F_DATA_VALID). It refers only to the inner header when
> !VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM or to both the inner and the outer
> when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set.

Ok, I finally got here. But another question is, if we use partial
cusm for outer, where does the device put outer csum_start/offset for
outer?

>
> The relevant spec wording is:
>
> """
> \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
>    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>    set: if so, device has validated the packet checksum.
>    If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature has been negotiated,
>    and either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
>    VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
>    the device can additionally set the VIRTIO_NET_HDR_F_DATA_VALID bit
>    in \field{flags}, meaning that the device validated the checksum,
>    set the csum_start and csum_offset fields, but did not provide the
>    partial checksum for the transport header.
>    If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been
> negotiated,
>    and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags},
>    both the outer UDP checksum and the inner transport checksum
>    have been validated, otherwise only one level of checksums (the inner =
one
>    in case of tunnels) has been validated.
> """
>
> Is that unclear? which part needs rewording?

I think this is less straightforward to have something like:

1) a new field called inner_flags
2) or a new bit VIRTIO_NET_HDR_F_INNER_DATA_VALID,
VIRTIO_NET_HDR_F_INNER_NEEDS_CSUM

Thanks

>
> Thanks,
>
> Paolo
>

