Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DCC1922E5
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585916; cv=none; b=EYota2W9+5b2RAc+Orb5YBGJyrLv3j69UX737vu3qN2jarnBfZgsEo/F9TukUM3wrl4GZi5UTeNZ/tA+7pvdcza/kuDLXnoZ11ARvdYw5kgg968O5YtAeYCH1/BjcbJTpVfP12j37TOTv2pkC0UiddwCGdaNpicZH07ej+Q5AOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585916; c=relaxed/simple;
	bh=spfVFaOqN4zG9iA2o8/PBhCWOGWHICn4i8oH62yX9fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KwjlLcAD/MWld28FpUPuShd0HvFhDSVENeXq7SnLB152us97rNDnq9ZrhmAlck9NNLK/kcZJDLAy70FoF5BpOLKl3UFiSSKrmOogLtUB8W4hMyabqoZVD7wy8jhuEX2kt96w3PYud0eF5Uz05i6J8iQC2ZkSp7Q8XCjzFzw+IFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=alpRkUQJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="alpRkUQJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717585914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S8SFdN/7ynIOA0KmOmHMDD7y3SKdMSckYLhZIsq325o=;
	b=alpRkUQJIp1hSqQTh6ymGIA0bNZnMCD5PKucSI+aKjrmlwPW3jl5EryZwU6U7JiNfYlZj9
	P1J3T+ptSEwohkrZeVJvtWS64/qm3CLb92e8nrE3KakQpAdOg4QdxpYQrF7IMA3GcKSarW
	rRHE0KqG/yY6bjfy78n2f59r+0oBMN4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-Ho4qCIHsNdCTff6-QtWCuQ-1; Wed, 05 Jun 2024 07:11:50 -0400
X-MC-Unique: Ho4qCIHsNdCTff6-QtWCuQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-57a50752cd2so815322a12.0
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 04:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717585909; x=1718190709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8SFdN/7ynIOA0KmOmHMDD7y3SKdMSckYLhZIsq325o=;
        b=ch4m8DrlMFxiFOUO5CFcPvYciNN57Dym/9BiymNlGiYp0iDmQFnpvgQYZdXI177nI3
         qBm0D6bCoy3fgyjQLLCnqXpHxnpoqh0azYWXqY8qGB1/U5Z6/JHlvpX0Fq1DBu7km3BY
         JiUcQMCdvxzlybB4/83gesI2wSZ+FdPCNB/ucn95xuUCFQHVQya5/iRaXBTBunL5+P7k
         yvHAWBckh73IPaE4lvWqpcvssBtUrlsBt+BJ7OtYFYYfb/oypkgWoy4X4Xfa5dJzYTfP
         JcLjSx2S9wx9NWNtxh7FkY2Dy72VfU0FWNupFKoKd4jr3eYvQBVsjxS4BgnoBmmaYE96
         4v2w==
X-Forwarded-Encrypted: i=1; AJvYcCXB5lD+iRjwpOyUHo2Ge5zoudWK26O8aBcFhm4sFDzLBUcmNRwsQRg80ArShNv4jRcUvr3vjuqFfMSJsWwDsS4v7KvDiBKWvv98d+qax5c=
X-Gm-Message-State: AOJu0Yyp8l24t9EK7dSdOh7KrMiHStnPWO8xYsJwa+YSD6jadsMrfjJ9
	N0Or/VteSQz0GQmoJajWuaVtfC58amrZtSDVtbqlGk7yqwVlz+bhc6Mua3I/ndQ0IA1JG09YZly
	IlJKFXuGN9mzsdxp6htPMt3ylKcMwqdwTa3cCgj7uMA1JepkgfWtJ9KbytdovtlHO
X-Received: by 2002:a50:8ad9:0:b0:57a:6e41:9d8d with SMTP id 4fb4d7f45d1cf-57a7a717b8emr4214775a12.18.1717585909564;
        Wed, 05 Jun 2024 04:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgGO50tahG4iIAASV2dZfJ/NypLKJbCUAaMwUqAkQt2MdYpLwuXEBB3pDeuES2nNBR45E9Ow==
X-Received: by 2002:a50:8ad9:0:b0:57a:6e41:9d8d with SMTP id 4fb4d7f45d1cf-57a7a717b8emr4214744a12.18.1717585908973;
        Wed, 05 Jun 2024 04:11:48 -0700 (PDT)
Received: from redhat.com ([2.55.8.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c9bbffsm9117276a12.81.2024.06.05.04.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 04:11:48 -0700 (PDT)
Date: Wed, 5 Jun 2024 07:11:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, Jason Wang <jasowang@redhat.com>,
	virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
Message-ID: <20240605071054-mutt-send-email-mst@kernel.org>
References: <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
 <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
 <794dd45767bf54385613c5d18c32ee11d474db87.camel@redhat.com>
 <CA+FuTSeDqrQ3FVjpmmQ31UbyGQA-fUsYz3=NmizC1U7Q8w6E3Q@mail.gmail.com>
 <4745e6a149bb8424ab3931ecf04ee941e6830c47.camel@redhat.com>
 <CA+FuTSfcte_aXYoog9=bQqH1v21xLk+G2V9zNo9KOwXCt8x2Tw@mail.gmail.com>
 <9d617e706dd834aedf07a5a61ebf994ab11fd1da.camel@redhat.com>
 <CA+FuTSf=YwKFVan8wLNuyyJXOX6dncFW2KZZYqdFEL_nadvoxg@mail.gmail.com>
 <65b844076079002a5dc61edcb15a1e14c73cb516.camel@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <65b844076079002a5dc61edcb15a1e14c73cb516.camel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jun 05, 2024 at 12:59:58PM +0200, Paolo Abeni wrote:
> On Mon, 2024-06-03 at 13:41 -0400, Willem de Bruijn wrote:
> > On Mon, Jun 3, 2024 at 10:17 AM Paolo Abeni <pabeni@redhat.com> wrote:
> > > On Fri, 2024-05-31 at 11:13 -0400, Willem de Bruijn wrote:
> > > > On Thu, May 30, 2024 at 1:15 PM Paolo Abeni <pabeni@redhat.com> wrote:
> > > > > On Thu, 2024-05-30 at 12:23 -0400, Willem de Bruijn wrote:
> > > > > > > > > > > inner transport header offset from the provided information, as it's
> > > > > > > > > > > currently the case for plain (not UDP tunneled) GSO packets.
> > > > > > > > > > > 
> > > > > > > > > > > The outer UDP header may carry a second checksum, which can be offloaded
> > > > > > > > > > > independently from the inner one. Since UDP tunnel checksum offload
> > > > > > > > 
> > > > > > > > Just require local checksum offload? Computing the outer checksum is
> > > > > > > > always cheap. Optional double checksum offload might add complexity
> > > > > > > > that is not needed, as it is so cheap.
> > > > > > > 
> > > > > > > The rationale behind the making the outer csum offload manadatory was
> > > > > > > to keep the specification change simple and prevent the exhaustion of
> > > > > > > the virtio_net_hdr flags and gso_type exhaustion. With this change,
> > > > > > > 'flags' has 4 bits used out of 8 and will raise to 5. 'gso_type' has 3
> > > > > > > 5 bits used and will raise to 6 (even if only 3 of them will be
> > > > > > > bitfields).
> > > > > > 
> > > > > > Perhaps we're talking about something different. I'm suggesting that
> > > > > > the outer checksum is not offloaded at all, because outer checksum
> > > > > > generation and validation is always cheap in software. This is the
> > > > > > premise of LCO.
> > > > > 
> > > > > If the guess produces GSO packets with outer checksum, and the virtio
> > > > > driver does not support the outer csum offload, the guest will have to
> > > > > do s/w segmentation. Even if computing the outer csum will be cheap,
> > > > > the segmentation will be bad enough by itself.
> > > > > 
> > > > > Am I missing something?
> > > > 
> > > > Do you mean virtio driver (in the guest) or device (in the host)?
> > > > 
> > > > All segmentation offload packets imply checksum offload. So the
> > > > virtual device must support checksum offload. In this case, of both
> > > > checksum fields.
> > > 
> > > I feel confused. I think the starting point was your request to avoid
> > > supporting (in the virtual device) outer checksum offload, and I read
> > > the above as quite the opposite?!?
> > 
> > Sorry for the confusion.
> > 
> > I agree that the outer transport offset is needed, after all.
> > 
> > Without segmentation offload, the outer checksum can be calculated
> > cheaply software.
> > 
> > But with segmentation offload, this either
> > - has to happen after segmentation, or
> > - the outer headers must already be setup for segments (GSO_PARTIAL)
> > 
> > The first approach requires the field.
> > 
> > The second is probably too much to ask of a virtio interface. Demanding
> > GSO_PARTIAL.
> > 
> > It would require the driver to
> > - split a tunnel GSO packet into a GSO and
> >   non-GSO pair if it payload length is not a multiple of mss.
> > - rewrite the outer headers to adjust the length fields
> > - compute the outer csum using LCO
> > 
> > It's not entirely crazy. The Linux kernel already can already do this for
> > drivers that advertise tunnel offload only as part of gso_partial_features.
> 
> I'm sorry for the latency.
> 
> Wrapping-up the above, I (mis?) understand you are ok with the proposed
> virtio_net_hdr layout changes.
> 
> WRT UDP tunnel outer header csum offload, I guess I could add (back,
> IIRC was there in a previous revision) the feature negotiation for the
> outer UDP header checksum. 
> 
> I think such feature negotiation makes sense only in the guest ->
> hypervisor direction, that is, device receive path, where we could hit
> possibly H/W implementation constraints. 
> 
> In the opposite direction it's just a matter of s/w support, it would
> be strange to me introduce UDP tunnel GSO and UDP tunnel outer checksum
> support separately.
> 
> WDYT, does the above makes sense to you? Or do you think we should
> negotiate the csum feature in both directions, for better symmetry?
> 
> Thanks!
> 
> Paolo
> 

We generally do negotiate csums in both directions, yes.
I'd rather we kept things consistent and we are not short on
feature bits.

-- 
MST

