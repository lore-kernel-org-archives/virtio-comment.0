Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25857483
	for <virtio-comment@lists.linux.dev>; Tue, 21 Oct 2025 03:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761015722; cv=none; b=q8f04/Ll+XG7UMm8wbRKNt9WdRC6KLNYGwb49XL0pQzaWb5T2AKbZkBciTiAuw/xxkptlTvFjbOZKNq4wqRNuaqmHGe3WA/cGF/0mdHPB+SdHXwLkQeMCaNqRMlMvwr4l7OeetVR8eiuRwsQsLmR3EIbsX2/pQyXconwmXlUhEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761015722; c=relaxed/simple;
	bh=AXCND7593heei6G7g9j6erF8gevGviQv53xIM7pXDuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZdHUw8yFPq/zodh3SvjDMRKn/klzguiEMqIa//ytgwk7O0d1aXeOAyj/8goI5BAhnr9Vk+I/zm9NsRpWYTPPGuQbzaHHlq0gdu+FVclVroKCoN0O+/xgDaVKv7750EIxDkF0gJllpkWO2XAT73GSZx1UwqATPaWMS5QCeU+QZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dz9qb3dI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dz9qb3dI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761015719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PHEOrrpoemi5KcH2Hm0U0v/k6GaZYw7h98LySVdKQPA=;
	b=dz9qb3dIL7V4LuV8wMwI/4sauDbGQSe04GfSbvMJvX26+OEqkgrmQQVv68qegJ6cbTo1by
	GX8v0eX6kXOUyokNSBXvszy5UWSqk8bhF3cw/8jiHYCcWbKfHHZRov55ghc1TYZZd+K6ar
	1AnybvjdLToSmZpQoM0FqIRjrzy6dGs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-ra4Dtc3WN9GA9O9ZhdIipw-1; Mon, 20 Oct 2025 23:01:58 -0400
X-MC-Unique: ra4Dtc3WN9GA9O9ZhdIipw-1
X-Mimecast-MFC-AGG-ID: ra4Dtc3WN9GA9O9ZhdIipw_1761015717
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29085106b99so49908835ad.1
        for <virtio-comment@lists.linux.dev>; Mon, 20 Oct 2025 20:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761015717; x=1761620517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHEOrrpoemi5KcH2Hm0U0v/k6GaZYw7h98LySVdKQPA=;
        b=Mv1dX8pnOEmQOLIuvDy5eSmNdFCc5NlAmSWgOIYo7d/XrEpUt/c9ONydXnun+iMkgY
         OTPIY/yd6twZg4SEJ8mETBeSzAjGfTlSC4kz0EjQPRrR7AWnir2PiSe4dLOFQ47dPRSq
         cfVcj/z2vt/Mwt94i9/n3Mc3LJln3biPY5V0wX6hxr4j3H8qYin1Zt7RQ33TneVeT++f
         GfMWVvYjc/ONEHN1PkHjK4bSJRUmw0zO1EisNmK6uLUC92JzxKmRJMVakp8mI/W7nDVG
         YiGRerDds0SGiMg/TQ0C4e7AcBl8CuMLLcU9eamSOydLlm5/UAKD7TUEJ3pox5RO2Eb4
         p6aA==
X-Gm-Message-State: AOJu0YxtqIFwmZyE783fuAXtupiwdjOuG3URV8SwPhX4kx/u6YjpHcT5
	jdUoM+SYcDTXvg30l3xolvf9b5cR5iG718AEU8uyJB+ELWLS8G41xRx8w2XFOPeisWLbth48+6P
	Rm7v15GlAszpZtMbPkbrVpRFOR+UKNRKkcqCaiZNUtakIhLCv0/aqg6PyxjJQDAnXamL+GSB8S9
	idPwZBz4+a4LUem9o+H/zLNiNHBicDW/qlpbKX5yEIWAQ=
X-Gm-Gg: ASbGncsmjjoDgh6IgAPohGzrpaSWOgJragCj518nCx8UKgaGo4WHb5iyFXNpERoD6mM
	nt6CzyrHZYKz9Y/PS2MTrrvOPUpD/J1t6PmZ0jquqS8dQIWBGhcXYTy6NyJIui5G1CPFdkD8uXi
	Y78dWSWVPTwGXOoFjeaAoswqweFfhjeVss6kpxWSpwFPHpH0d/k4rQ
X-Received: by 2002:a17:902:e5c9:b0:273:daa6:cdf9 with SMTP id d9443c01a7336-290c9cdd599mr174720445ad.22.1761015717288;
        Mon, 20 Oct 2025 20:01:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa5fJ824UiJ6eG5kJE/AF02qoJyP8OT0tTvr2CvNQjfRjEDXEqJVG/BfNyizcokw+KdC2ffLiz3IgxE7AqSZ0=
X-Received: by 2002:a17:902:e5c9:b0:273:daa6:cdf9 with SMTP id
 d9443c01a7336-290c9cdd599mr174720155ad.22.1761015716837; Mon, 20 Oct 2025
 20:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014042243.22087-1-jasowang@redhat.com> <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
 <20251015030738-mutt-send-email-mst@kernel.org> <CACGkMEvBmNZCTrn9cWD+wByjNa+q-iEUOA6PK_GmWcqTdB5YMQ@mail.gmail.com>
 <20251016020113-mutt-send-email-mst@kernel.org> <CACGkMEtO5Z1-gwWLLm5TN4L6Sc5F6Vf+O_5W_joMq8p+TGV6Xg@mail.gmail.com>
 <20251016031546-mutt-send-email-mst@kernel.org> <CACGkMEtDwxWXqdN7ESk5QvmLwTg7GnspZJFu0r-o=XpKTzBGyA@mail.gmail.com>
 <20251020040059-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251020040059-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Oct 2025 11:01:45 +0800
X-Gm-Features: AS18NWDNiyxteITsUkuvutTG9IVnn90oRArkFMBIVWPMUxdlaxPaYTQPCWKdDks
Message-ID: <CACGkMEsaKi7uG_1sQwH5aW0510sDaHkzW9gYbz4ozpzV7UgTrw@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com, nguyenlienviet@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yFLEe3_0xyPJvSfEH-wHML8oSmKEr__JdmHasJ6XHHY_1761015717
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 4:19=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Oct 20, 2025 at 02:25:56PM +0800, Jason Wang wrote:
> > On Thu, Oct 16, 2025 at 6:03=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Thu, Oct 16, 2025 at 02:31:46PM +0800, Jason Wang wrote:
> > > > On Thu, Oct 16, 2025 at 2:17=E2=80=AFPM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > On Thu, Oct 16, 2025 at 01:57:41PM +0800, Jason Wang wrote:
> > > > > > On Wed, Oct 15, 2025 at 3:27=E2=80=AFPM Michael S. Tsirkin <mst=
@redhat.com> wrote:
> > > > > > >
> > > > > > > Thanks for the answers. Some more comments:
> > > > > > >
> > > > > > > On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> > > > > > > > > >  device-types/net/description.tex | 46 ++++++++++++++++=
++++++++++++++++
> > > > > > > > > >  1 file changed, 46 insertions(+)
> > > > > > > > > >
> > > > > > > > > > diff --git a/device-types/net/description.tex b/device-=
types/net/description.tex
> > > > > > > > > > index 415c7fd..e56df75 100644
> > > > > > > > > > --- a/device-types/net/description.tex
> > > > > > > > > > +++ b/device-types/net/description.tex
> > > > > > > > > > @@ -146,6 +146,9 @@ \subsection{Feature bits}\label{sec=
:Device Types / Network Device / Feature bits
> > > > > > > > > >   when VIRTIO_NET_F_IPSEC is negotiated. When a device =
offers IPsec feature, it SHOULD
> > > > > > > > > >   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
> > > > > > > > > >
> > > > > > > > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT(71)] Device limits t=
he maximum TCP
> > > > > > > > > > +  length and the number of segments when performing TC=
P segmentation.
> > > > > > > > > > +
> > > > > > > > > >  \end{description}
> > > > > > > > > >
> > > > > > > > > >  \subsubsection{Feature bit requirements}\label{sec:Dev=
ice Types / Network Device / Feature bits / Feature bit requirements}
> > > > > > > > > > @@ -184,6 +187,7 @@ \subsubsection{Feature bit requirem=
ents}\label{sec:Device Types / Network Device
> > > > > > > > > >  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F=
_CTRL_VQ.
> > > > > > > > > >  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_=
CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> > > > > > > > > >  \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_=
CTRL_VQ and VIRTIO_NET_F_RSS.
> > > > > > > > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT] Requires VIRTIO_NET=
_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6
> > > > > > > > > >  \end{description}
> > > > > > > > > >
> > > > > > > > > >  \begin{note}
> > > > > > > > > > @@ -220,6 +224,8 @@ \subsection{Device configuration la=
yout}\label{sec:Device Types / Network Device
> > > > > > > > > >          le16 rss_max_indirection_table_length;
> > > > > > > > > >          le32 supported_hash_types;
> > > > > > > > > >          le32 supported_tunnel_types;
> > > > > > > > > > +        le32 tso_max_size;
> > > > > > > > > > +        le32 tso_max_segs;
> > > > > > > > > >  };
> > > > > > > > > >  \end{lstlisting}
> > > > > > > > > >
> > > > > > > > > > @@ -276,6 +282,19 @@ \subsection{Device configuration l=
ayout}\label{sec:Device Types / Network Device
> > > > > > > > > >  Encapsulation types are defined in \ref{sec:Device Typ=
es / Network Device / Device Operation / Processing of Incoming Packets /
> > > > > > > > > >  Hash calculation for incoming packets / Encapsulation =
types supported/enabled for inner header hash}.
> > > > > > > > > >
> > > > > > > > > > +The following field, \field{tso_max_size} only exists =
if
> > > > > > > > > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > > > > > > > > +It specifies the maximum TCP length
> > > > > > > > >
> > > > > > > > > what is TCP length?
> > > > > > > >
> > > > > > > > It's defined in the rfc793:
> > > > > > > >
> > > > > > > > """
> > > > > > > >       The TCP Length is the TCP header length plus the data=
 length in
> > > > > > > >       octets (this is not an explicitly transmitted quantit=
y, but is
> > > > > > > >       computed), and it does not count the 12 octets of the=
 pseudo
> > > > > > > >       header.
> > > > > > > > """
> > > > > > >
> > > > > > >
> > > > > > > But that one is 16 bit so can not exceed 65535.
> > > > > >
> > > > > > I just reuse the terminology instead of defining something new.
> > > > >
> > > > > Let's use a generic term that will work with big tcp.
> > > >
> > > > After glancing at RFC TCP length seems to be the best as TCP header
> > > > doesn't have a length.
> > > >
> > > > Maybe you have something better in mind?
> > >
> > >
> > > Depends on what do you mean by it, exactly.
> >
> > TCP header length plus the data length. Maybe TCP packet length?
>
> Hmm. It's not even a packet length is it?
> Linux has this:
>         Device (as in HW) limit on the max TSO request size
>
> but switching to "request" is more work.
>
> for now, we have:
>
>
>
>
> \item If the driver negotiated
>   VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO, and the packet requires
>   TCP segmentation, UDP segmentation or fragmentation, then \field{gso_ty=
pe}
>   is set to VIRTIO_NET_HDR_GSO_TCPV4, TCPV6, UDP_L4 or UDP.
>   (Otherwise, it is set to VIRTIO_NET_HDR_GSO_NONE). In this
>   case, packets larger than 1514 bytes can be transmitted: the
>   metadata indicates how to replicate the packet header to cut it
>   into smaller packets. The other gso fields are set:
>
>
> So if we just go with "length of a packet that requires TCP
> segmentation" then I think it's at least not making things
> any worse.

Ok, I will do it.

>
>
> > >
> > > > >
> > > > > > Note
> > > > > > that it is only used in pseudo header for csum after device has
> > > > > > performed TSO. The value in the pseudo header is capped by MTU/=
MSS.
> > > > > >
> > > > > > As replied in another thread, BIG TCP requires more work or fea=
tures.
> > > > > > Driver needs to set ip->tot_len 0 with a new gso type to let th=
e
> > > > > > device know about BIG TCP packet.
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > of a TSO packet
> > > > > > > > >
> > > > > > > > > what is a TSO packet?
> > > > > > > >
> > > > > > > > Packet for device to perform TCP segmentation offload.
> > > > > > >
> > > > > > > pls define terms before use.
> > > > > >
> > > > > > I may miss something but TSO has been widely used in the spec b=
efore
> > > > > > this feature:
> > > > > >
> > > > > > """
> > > > > > \item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with E=
CN.
> > > > > > ...
> > > > > > \item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can receive TSOv4.
> > > > > > ...
> > > > > > """
> > > > >
> > > > >
> > > > > Yes but that does not define a "TSO packet".
> > > >
> > > > How about a patch beforehand to explain thing like:
> > > >
> > > > \item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO (TCP
> > > > Segmentation Offload) with ECN.
> > >
> > > That does not define is either?
> > >
> > > virtio$ git grep 'TSO packet'
> > > virtio$
> >
> > Something like this?
> >
> > Maybe "TSO packet is the packet that device may segment it into
> > multiple frames"?
>
>
> The current text is a bit of a mess where "packet" interchangeably means
> the result of segmentation or the request to segment.
> We should fix that but for your patch I think it is reasonable
> to just spell it out at each instance: "packet that requires TCP
> segmentation".

Fine.

Thanks

