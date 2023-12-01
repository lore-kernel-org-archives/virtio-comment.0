Return-Path: <virtio-comment-return-8702-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8DEC4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 04:32:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5000F22375
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 04:32:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A18098687E
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 04:32:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 08786986699; Fri,  1 Dec 2023 04:32:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E82F598669D
	for <virtio-comment@lists.oasis-open.org>; Fri,  1 Dec 2023 04:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701405126; x=1702009926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrMTUi3n3IWXwZa5eA+PFZzxsM63bvwmlOED7OcwQH4=;
        b=JmGEf9mzQJ3AGuUT4XHFZ0vZgNXYa7EVnKY7Qkuq19oJomm2Ja4hRfjBp9vsuiNX5y
         TnrMxPogXpoQMXT6qjItr67XyXWyYJwsIakRib7LJNUB832JFT7PwykFB4ZKHtSM3SHt
         42RzApbT2bcPPNxrJo3Gd9XBobZAo9eCMkSPuxtdiW4hwKzCmAzWQDHdG0ruVC/mDWgq
         59feNVpWJZ/7u0VGOQldET12ws5UYsbL7VcDyRKZZtkz9/ZlJJSNwbJTVBYsTJyEwuDc
         +8xbP0p4V/IFHl9W7fJwc2J8vXCwbQ6biSM9lJk9cCFvh67FhI/y2PSrYn/O4P5562sh
         s7AQ==
X-Gm-Message-State: AOJu0YxhcLqvbM1y9b/h3iy4lt7VWqLttsToVChrrYJVTQq85zw5+Fmh
	Cb+V7dKMaeQEL9I91jFioLJRkQ==
X-Google-Smtp-Source: AGHT+IES6NnrZNzbKs95kcDqQM7WoVdH2iF+aZ46wAwRfcSUMgIMPHu4nauxNEUqMUieWOe9my5h9Q==
X-Received: by 2002:a17:90a:bc84:b0:286:2013:cfe9 with SMTP id x4-20020a17090abc8400b002862013cfe9mr10029125pjr.2.1701405126556;
        Thu, 30 Nov 2023 20:32:06 -0800 (PST)
Date: Fri, 1 Dec 2023 10:02:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haixu Cui <quic_haixcui@quicinc.com>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
	cohuck@redhat.com, harald.mommer@opensynergy.com,
	broonie@kernel.org, qiang4.zhang@linux.intel.com,
	quic_ztu@quicinc.com
Message-ID: <20231201043203.7ozpnk2k3dci4pq4@vireshk-i7>
References: <20231130092242.17303-1-quic_haixcui@quicinc.com>
 <20231130092242.17303-3-quic_haixcui@quicinc.com>
 <20231130111900.ix3cfsxlns2blp4r@vireshk-i7>
 <b26382c1-6601-44b8-8376-3f96d605f2d5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b26382c1-6601-44b8-8376-3f96d605f2d5@quicinc.com>
Subject: [virtio-comment] Re: [virtio-dev] [PATCH V6 2/2] virtio-spi: add the device
 specification

On 01-12-23, 12:05, Haixu Cui wrote:
> Looks good. Will update as follows:
> 
> \field{tx_nbits_supported} and \field{rx_nbits_supported} indicate the
> different n-bit transfer modes supported by the device, for writing and
> reading respectively. SINGLE is always supported. A set bit here indicates
> that the corresponding n-bit transfer is supported, otherwise not:
>         bit 0: DUAL;
>         bit 1: QUAD;
>         bit 2: OCTAL;
>         other bits are reserved and must be set as 0 by the device.
> 
> Note: Transfer bit options are commonly used in SPI:

Maybe:

Note: The commonly used SPI transfer modes are:

-- 
viresh

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

