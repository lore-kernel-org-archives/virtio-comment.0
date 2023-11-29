Return-Path: <virtio-comment-return-8669-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3189CC4167B
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 07:30:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 80920330AC
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 07:30:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 50E10986656
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 07:30:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 308CD9865EB; Wed, 29 Nov 2023 07:30:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 20F9D9865ED
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Nov 2023 07:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701243025; x=1701847825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCgXQeuYSvcn+zfTzD3xw5BucyRBYj+vejJmJ+sKgtc=;
        b=Yq9Uwk3oiMaBTyBxPbV8MhNyh4j9MwDc3ZAkWWFEyrr9kwoo724tIEfKmuBxJsjcEy
         aZJN2MhE7JaaNASTvhTDRzso+rttHAjjbC/IMi045ByktR5FdhLZm2elO6O0fBvuU/Ax
         yYMwtYy1VmeIN1louv/25CqZkw4ajFclTbHbBng1PFQqz18FiHLZ1EOc9OTDycrkg8ha
         +l6qaUrllCN3LMWrXS7Iwi4Ysq/KIBpazgd3DWhGpyePSKbZ31nNeJ/cJU7btU8bVEIL
         3KfKk9Ulc61RNKzkVPVPxGzOdwZcBjQ3rXGEeF0hlwNUvstDnx9ng/VYWF717KE9BhWe
         EJ0w==
X-Gm-Message-State: AOJu0YzpmzmbrL59jCamIJN2qRLxLm75zMMrCwJ0Mf03lk5UXxJuue0j
	2ukxWnNNDuvznIbU4P+M5T3mmQ==
X-Google-Smtp-Source: AGHT+IFyAr/CX/AXzmMDrjeKka/rSAE1SCZUUsUDoDLBEdLXlnD5C6Unmjxq2Q8/0QZ+OVVr4G30RA==
X-Received: by 2002:a05:6a20:8f19:b0:188:39e:9054 with SMTP id b25-20020a056a208f1900b00188039e9054mr21295414pzk.6.1701243024970;
        Tue, 28 Nov 2023 23:30:24 -0800 (PST)
Date: Wed, 29 Nov 2023 13:00:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haixu Cui <quic_haixcui@quicinc.com>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
	cohuck@redhat.com, harald.mommer@opensynergy.com,
	broonie@kernel.org, qiang4.zhang@linux.intel.com,
	quic_ztu@quicinc.com, alex.bennee@linaro.org,
	vincent.guittot@linaro.org
Message-ID: <20231129073022.ohxsfuawambvh3hm@vireshk-i7>
References: <20231124072015.12655-1-quic_haixcui@quicinc.com>
 <20231127101750.6xmthho6lnppyw3k@vireshk-i7>
 <2ca987a6-eeb2-4ed6-9a12-10ae450eb4bf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ca987a6-eeb2-4ed6-9a12-10ae450eb4bf@quicinc.com>
Subject: Re: [virtio-comment] [PATCH] [PATCH v5] virtio-spi: add the device
 specification

On 28-11-23, 20:58, Haixu Cui wrote:
> On 11/27/2023 6:17 PM, Viresh Kumar wrote:
> > On 24-11-23, 15:20, Haixu Cui wrote:
> > > +For half-duplex read transfer, \field{rx_buf} is filled by Virtio SPI device and consumed
> > > +by Virtio SPI driver. For half-duplex write transfer, \field{tx_buf} is filled by Virtio
> > > +SPI driver and consumed by Virtio SPI device. And for full-duplex read and write transfer,
> > > +both \field{tx_buf} and \field{rx_buf} are used.
> > 
> > Should the length of both the buffers in full-duplex mode be same ? If yes, then
> > this should be mentioned (in case it is not).
> > 
> 
> No, there is no such limitation. Write and read buffers may be different is
> size.

Hmm, I worked with a SPI controller over a decade ago, and I must be forgetting
something here I guess. But from whatever little I remember, with full-duplex
transfer, data flows on both MOSI and MISO lines as soon as clock signal is
applied.  And so amount of data sent is always be equal to amount of data
received by both sides.

Also if I see Linux's implementation of the `struct spi_transfer` [1], I see
`tx_buf`, `rx_buf` and a single `len` field, which applies to both the buffers.
Which I guess is indicating that both buffers are supposed to be of same length.

What am I missing ?

> > > +Virtio SPI device MUST NOT change the data in \field{tx_buf} if transfer type is half-duplex write
> > > +or full-duplex read and write.
> > 
> > The device MUST NOT change the contents of the tx_buf ever, i.e. for every mode
> > there is. In half-duplex read mode, there is no tx_buf, but just rx_buf.
> > 
> 
> Sorry I don'y understand here. In this statement, the transfer type is
> either half-duplex write or full-duplex read and write. half-duplex read
> type has no tx_buf, so I didn't mention it.

Sorry for not being clear earlier. I was suggesting you to just write this
instead:

The Virtio SPI device MUST NOT change the data in the \field{tx_buf} field.

You don't really need to specify the modes here, as we are talking about tx_buf,
which isn't available in the half-duplex read mode but all others.

--
Viresh

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/spi/spi.h#n1031

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

