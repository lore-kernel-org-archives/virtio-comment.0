Return-Path: <virtio-comment-return-8169-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8990C4332F
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 16:17:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 10711330A9
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 16:17:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB5319866C8
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 16:17:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C9BA19866B4; Sun,  5 Nov 2023 16:17:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B9D879866B5
	for <virtio-comment@lists.oasis-open.org>; Sun,  5 Nov 2023 16:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: aFfIoYr8Me-ldD_dBPdy7A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699201024; x=1699805824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muiD4F4OI11xsGm4x5e3srvMzxg6XkyHyT0IVI/tVIY=;
        b=aDgLWvd3c5RC7lU5rmNmOxaJKyEQNlzihJMv3DJ+UEw0jB5BdQuU0RHs6BMoPFZUjt
         Pa0bjeFGFTJhMNHC4s00YnliPqDIANGgaiJ1fZ7n2OpnAY6y6trx7XYIqNbUHMo0ETZv
         wF8uC+C21a+jePoicjyQaqBkbaYocd9qyP+YNdzfHBhupKOii3ezILoDw5qdkoQLYQ84
         B4A7bgFhaDn3orniInRxthVhb6Eo0xnA7AJau+L1+sxxclEwiLKI9cZ9u5oxi5y9geUV
         1PPAoNP17WnH5GjIJAuUDQEuhIkOHpqBznQD0zgemYGiUwuffG01GYuQLY0r63rhb3qj
         KZ+Q==
X-Gm-Message-State: AOJu0Yz6zpzemtUW7VKBQp/2vORyFbZq4QMXni036LtPp9QJycjFN+WV
	1BC/4yVs5mknhAllRm43xdxYayjUvgqkh4NfBMhYh9kLllKxtMMIyJfl33LYaeFBKYL91CAqJWs
	bzDc9JWGk+kXw1W3++wjjkHMuFuCvDjTwBg==
X-Received: by 2002:a17:907:3d89:b0:9ae:699d:8a2a with SMTP id he9-20020a1709073d8900b009ae699d8a2amr12047535ejc.5.1699201024297;
        Sun, 05 Nov 2023 08:17:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOyIFuIO3grhNAPykoPimN8X+7qr3rD7Yj47v2gVTx/n8pSuKwaXIUkoF0x7+EzfsRm6JAXA==
X-Received: by 2002:a17:907:3d89:b0:9ae:699d:8a2a with SMTP id he9-20020a1709073d8900b009ae699d8a2amr12047518ejc.5.1699201023967;
        Sun, 05 Nov 2023 08:17:03 -0800 (PST)
Date: Sun, 5 Nov 2023 11:16:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231105111232-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <a9103f82-c95e-47a6-9284-667c1c991aba@intel.com>
MIME-Version: 1.0
In-Reply-To: <a9103f82-c95e-47a6-9284-667c1c991aba@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Fri, Nov 03, 2023 at 10:32:59PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/3/2023 6:50 PM, Michael S. Tsirkin wrote:
> 
>     On Fri, Nov 03, 2023 at 06:34:37PM +0800, Zhu Lingshan wrote:
> 
>         +\item[\field{bitmap_addr}]
>         +       The driver use this to set the address of the bitmap which records the dirty pages
>         +       caused by the device.
>         +       Each bit in the bitmap represents one memory page, bit 0 in the bitmap
>         +       reprsents page 0 at address 0, bit 1 represents page 1, and so on in a linear manner.
>         +       When \field{enable} is set to 1 and the device writes to a memory page,
>         +       the device MUST set the corresponding bit to 1 which indicating the page is dirty.
>         +\item[\field{bitmap_length}]
>         +       The driver use this to set the length in bytes of the bitmap.
>         +\end{description}
>         +
>         +\devicenormative{\subsubsection}{Memory Dirty Pages Tracker Capability}{Virtio Transport Options / Virtio Over PCI Bus / Memory Dirty Pages Tracker Capability}
>         +
>         +The device MUST NOT set any bits beyond bitmap_length when reporting dirty pages.
>         +
>         +To prevent a read-modify-write procedure, if a memory page is dirty,
>         +optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1.
>         +
>         +The device MAY increase \field{gra_power} to reduce \field{bitmap_length}.
>         +
>         +The device must ignore any writes to \field{pasid} if PASID Extended Capability is absent or
>         +the PASID functionality is disabled in PASID Extended Capability
> 
> 
>     I have to say this is going to work very badly when the number of dirty
>     pages is small: you will end up scanning and re-scanning all of bitmap.
> 
> The driver needs to scan anyway,

Not with e.g. Parav's proposal - device reports individual pages
changed. This is analogous to PML.

> Intel production work with similar bitmap
> based dirty page tracking solution for years.

and then VMs became bigger and PML was introduced.

> Otherwise the device should report PFN which is not very practical.

Why not?

>     And the resolution is apparently 8 pages? You have just multiplied
>     the migration bandwidth by a factor of 8.
> 
> No, as described in the comments, the tacking granularity is controlled by \
> field{gra_power}, one bit represents a page with page_size = 2^(12 +
> gra_power). This can also be used to reduce the size of the bitmap.

.. at the cost of increasing migration bandwidth.

> "To prevent a read-modify-write procedure, if a memory page is dirty,
> optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1."
> 
> This is optional and DMA is very likely to write a neighbor page, and the device transmit a whole byte anyway
> when a bit is dirty.
> 
> How about we use platform dirty page tracking facility then implement this in virtio, as Jason suggested?
> 

Without something like PML it likely won't scale either.

-- 
MST


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

