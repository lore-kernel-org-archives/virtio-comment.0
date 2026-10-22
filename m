Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653864;
	b=Pe35EUsfR1txA4PdSAq9LLHkxD14hwljIiHJp+vHxtF45jSQdjb/sWhJWxygqRwRR9c0
	 TEFZ7e1y4fah7DSnyDzkf5l6haa2StCApQb4gzArqKdscX4PF07LDwsYGbYF9aQbVV3JY
	 P6k1qCyfQg3YGoezvtQ4FGxpJ82OL2jEW7ByQaWfgQvFpQL7QFdomJcR7Rim5kq8ZuVDf
	 zjkpgth6EcVBOlA6mFAlhYn9BT9eqT8APPHxt0plNQWXctmJDPIhfy/gwDBz6tsTTuVPZ
	 xBM8BmlPLJbVlwzbydQwj3wyUr9yiWEqrWKXPCB12k+b05KhxcYOpPKj7+jpyta2TqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653864;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=PMupZqYhOhRb1zMoGZ4d5nwfajBZs5OijUNKKUJB7bA=;
	b=iFClORgtas1j72QWWdHETDLeAy58rCxPum4ieb64+ENEpwM+F3wzbJchSTV8p4NsyHpw
	 Nn1HCHn1pZvXYaXbyvNiY2LGvP1DWUvw4lENppZooBeqJIoLGdRh0OFLRMoLjrENuhBWq
	 n+9jprQB6EPcaFvvIHAFfDst6yCDkBaoAo0TOddzl2HFE2sOIHM3NK+WvIbrxtC/98piV
	 KaR1q9HDGbFEhJlSfWaeNUMey+V8l7wb7E+GF3PztYAacN1e/Xdyzkn/hFMcZ6vo74P8G
	 XmzRiU2Gu9YbipiEHHdnKEZXzL1T6ZBTBsj8Nl6/t5DZj8MpdQLHbhVNXZ2AM4C6baQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P8UPnbgI;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66023606A31A
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 07:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66023606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P8UPnbgI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792653862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PMupZqYhOhRb1zMoGZ4d5nwfajBZs5OijUNKKUJB7bA=;
	b=P8UPnbgI9L/EIQRc4eZVWCt/2tPUD421py+43h/ZlPmZlHfMqu1WrqN8LNRv4Hj7hzho8P
	ZPTSjJKCkjyzeHN8O4AgLq4T3GeVQD5DVZPsmNTo8/lkmNUq/1Znv/m41l05nTeGmKmMT9
	H3zA6dWYPtILDwAwHJtJN6bCmVl5+Nc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-giTWa6fLMayt5ZaUo26XLw-1; Thu, 22 Oct 2026 07:24:20 +0000
X-MC-Unique: giTWa6fLMayt5ZaUo26XLw-1
X-Mimecast-MFC-AGG-ID: giTWa6fLMayt5ZaUo26XLw_1792653860
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so11221135e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 00:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653860; x=1793258660;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PMupZqYhOhRb1zMoGZ4d5nwfajBZs5OijUNKKUJB7bA=;
        b=PIbBOsOrqleLvlXIGm8vWWw4ombVXbKhe6il83qgLxnD8ZB5X8Sqykyq0ds78HKuIa
         3sfSbkB6PRf9rBQF+qMWJXiXFXQis0k5WRoVrOVKvGUbD0kmqujkhjQORUSL15+qfzY/
         ppkvXifjB9t4UPyyWE1GvzmBtOo1pgOyIznRvoTO3b1wAmhkhbo3aQe/z702gVv9D4+Q
         0O3T3XxTsTpxZ7Xtf7wcoOQIkcECU7k9Oey4rBrFQtVwYj/7j6nwm0EEyM2Rp/FPf1Co
         Q55j1ri1kNKbfUrw6bgBsgpWT9mb16vdM8BbEuiIqwWxThctOa4kUOP2aH3yz8W/WzQ/
         fwfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFkgWkaqwvTabe2a0cS5CcXuIPinmUNo3sNqtu4kICtAYbd2quzeNTQmWtjiZjmhX87euBG8uPW+pWtl53Xg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKpQxGVE+Bzd34A0hk6g1GyN+4EaoGcQGj56suDzP8oYBHakrKM
	/6eniIR/152QiB/A/ksJQLyGOqsqB+chOd2eQ2hHSGhp7QDvaJwQIj3x52cQPajM3Dqf/wqTLMD
	DS1WpNhZTixa+mJIa64bo5RIKkEh9VzoZN+yAJyNaoDL4G9EqNM3pbnuSgyaUGGOSVKmb
X-Gm-Gg: AYBFou32UTAaM7WTiP6clVShaMx4UQp9aGOp62q8P37xFi//vPofF7JuVYFCyqFr6NQ
	LdloWuc6cAX7eXlUR//ljtOdTGuFubVpHof+EqFS/D6toGt8Z5ialPqPmq2Ii1kQMF6ZYBZ9uxU
	MJCPVpsYKcyD0fYmul6gQR8LS3h0twgQ/+oKZkhfrOVpV+nVkAf8lT+UnDC9mRog1bmfitt4683
	lId22cNJvRdvi7qPt/FJpuP2mdAmOXCTFj2pZm7WM/Qfv75e2UMA6TGy8jXtLGeYgv12TP2Uhua
	P+J1ScIQUlI4bShh/GLrt8J/Fk/SYQNKnDkSlFTUjyzoYuziFWiFCkqShlvDEuhR7kE=
X-Received: by 2002:a05:600c:3507:b0:4a1:96cd:2f73 with SMTP id 5b1f17b1804b1-4a1fd8cd9e8mr88483325e9.1.1792653859591;
        Thu, 22 Oct 2026 00:24:19 -0700 (PDT)
X-Received: by 2002:a05:600c:3507:b0:4a1:96cd:2f73 with SMTP id 5b1f17b1804b1-4a1fd8cd9e8mr88482955e9.1.1792653859039;
        Thu, 22 Oct 2026 00:24:19 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b66f6bsm69530725e9.15.2026.10.22.00.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:24:18 -0700 (PDT)
Date: Thu, 22 Oct 2026 03:24:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Peter Hilber <peter.hilber@oss.qualcomm.com>,
	virtio-comment@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <20261022032118-mutt-send-email-mst@kernel.org>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
 <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
 <20261021154801-mutt-send-email-mst@kernel.org>
 <87mrs62vzj.fsf@redhat.com>
 <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bqKYGIB2x948fiNbwAFurmVkfcry_KOpHQVBMvY5fkY_1792653860
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 03:07:41AM -0400, Demi Marie Obenour wrote:
> On 10/22/26 00:35, Cornelia Huck wrote:
> > On Wed, Oct 21 2026, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > 
> >> On Wed, Oct 21, 2026 at 03:25:31PM -0400, Demi Marie Obenour wrote:
> >>> On 10/21/26 14:00, Peter Hilber wrote:
> >>>> Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> >>>> Firmware Interface). QPSFI devices expose functionality across SoC
> >>>> subsystems through a common Virtio-based protocol. There are no plans to
> >>>> standardize the devices.
> >>>>
> >>>> The Linux DCP display driver series is planned as the first user of this
> >>>> device ID:
> >>>>
> >>>> https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com/
> >>>>
> >>>> Device ID 51 is already reserved for the Virtio HAB device:
> >>>>
> >>>> https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren@qti.qualcomm.com/
> >>>>
> >>>> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> >>>> ---
> >>>>
> >>>>     v2:
> >>>>     
> >>>>     - Rename the device from "Snapdragon device" to "QPSFI device".
> >>>>     
> >>>>     - Refer to DCP Linux driver patch as planned first QPSFI user.
> >>>>     
> >>>>     v1:
> >>>>     
> >>>>     - Was posted as "content: Reserve ID 52 for Snapdragon device":
> >>>>     
> >>>>       https://lore.kernel.org/virtio-comment/20260826115504.1955-1-peter.hilber@oss.qualcomm.com/
> >>>>
> >>>>  content.tex | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/content.tex b/content.tex
> >>>> index 243ce2dde36b..7416939e67d3 100644
> >>>> --- a/content.tex
> >>>> +++ b/content.tex
> >>>> @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
> >>>>  \hline
> >>>>  50         &   Video encoder/decoder device \\
> >>>>  \hline
> >>>> +52         &   QPSFI device \\
> >>>> +\hline
> >>>>  \end{longtable}
> >>>>  
> >>>>  Some of the devices above are unspecified by this document,
> >>>
> >>> I think it would be best to have a single ID for vendor-specific devices.
> >>> I believe most of the ID space has already been used, at least for virtio-PCI.
> >>> -- 
> >>> Sincerely,
> >>> Demi Marie Obenour (she/her/hers)
> >>
> >> Sounds like a good idea to me. And then qualcomm can do what they
> >> want, like check subsystem id for pci or whatever?
> >> Only issue is there is no way to distinguish for mmio/ccw.
> >> Maybe, add vendor specific id as first e.g. 8 bytes ro in the config space?
> >> Peter?
> > 
> > Using some information in the config space looks like the most flexible
> > way to me. Are we still happy with how the device ids are organized in
> > general (i.e. when do we want a new one, and when do we want to extend
> > an existing device?)
> 
> For a platform device like this, I'd prefer to pass the information out
> of band.  After all, this device will only ever be found on Qualcomm
> SoCs, and presumably the kernel knows exactly which PCI device is
> supposed to be the QPSFI device.  This means that the kernel can just
> special-case it.

Yes but we are discussing making this id a general "vendor specific
device", as opposed to a "qualcomm device".
Could you share, e.g. if this device has config space, and whether
reading X bytes at offset 0 of this device is harmless, for some value
of X?

> Would it make sense to put this in the ACPI tables or device tree?

As long as it's vendor specific.

> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)



