Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FCC156967
	for <virtio-comment@lists.linux.dev>; Wed, 24 Jul 2024 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721819182; cv=none; b=AgCx5nmYS8tUK09i0ExsrM7cBSTUMuDfI8wjiD/e0wAUaJTTwlBaNNwsJdljCWVEG+VnbzAoEFcOquWeEg2UttuHH+x9u+2+3/JReFSG2vX/8M1IJTOR4G0fU7axT603lNJ2eUnwGTyTRQKhWUpzIs/exkHSjiDv0QuSTgb1iRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721819182; c=relaxed/simple;
	bh=+78PdpmdjgmuXuDgjfDke3mijWfJ5rxRDUJS/j5k2NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=I0Z7PsS2xa/LQtNqAxltINA8h2TapLGHoUUAGvfWCuDkkpH3zoVb+lbLubCHJqZOfiqVAkAeBOY08dpiHgc/VHPAjMXyj9cEbNfizQapY9HgpPMrMyRuIR1wQkmmuBiPNgWLEd4KL6MpNg4n8TxOSv5LJR7jlfyBcJjmPbZLL2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KtRfzTnq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KtRfzTnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721819179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ogr2MTbSa2gNLy96Qkn6lcoEutmncRJUOLbVNGwkS8=;
	b=KtRfzTnqZ746ryociwJU70E92Bdh605XSrPOJ05bHG6nvamULQurPoauSgO/98UFkWUUQb
	0XlqLZSz/qMCcG/SFTGk8cl27nvmgErHYbem6RKEP9A+68p/cvQeNXbPuXZzYL2d+gM4SO
	w5GsC/7iBCJfa63GMnDL0g1F7FC7tmE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-aU4psE2MMGmHQ-4f_HQ5kg-1; Wed, 24 Jul 2024 07:05:44 -0400
X-MC-Unique: aU4psE2MMGmHQ-4f_HQ5kg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42668796626so49510305e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 24 Jul 2024 04:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721819143; x=1722423943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ogr2MTbSa2gNLy96Qkn6lcoEutmncRJUOLbVNGwkS8=;
        b=lIG6KC8SixytSc36yw9WVbvU3AR7tdpIiFj7ft31B+Qhb8OUd0S24EjlCuVDsXWQvi
         xQvbBhGgbxCoF0lKf4PlVUPAdHB70TiVhr5A8v5R7rdXhYA/yByc5m1QHJNdCiDAI4Rk
         TrsXwFBNjsAjNTZc5SdJcaoOzMr2JF4QuN2gjMpN+1FTKi/7DAyo432o4JR135etdwKF
         V4OhIreHQInBeZQiIhlYA/IkQiBvpX0pQOolW5wPcGn7D6cPcVQppCeCtvELhQm3xhnb
         8QweDPbcDIM6kS83NZ4lSH8GNCJePgs2JXwSDL52Gzi70fZBaH51VR8R3+E76WXLZAg1
         54Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUwffRpT/DVkFGM5ZcDbzDq286XLNSmtWBatOR5ziZZZxrQKjEw9J9Fs6l/IQRoBCJeNgCdkdr0S46icAiypEJWiF/avwHm41601PGzlek=
X-Gm-Message-State: AOJu0YwfNz3q7cfCXCvlcFgOrQa/kZajnQLqd3yKbQl8uyTvVnRhT0EJ
	/5B8jVyH7xeGimRtingjjgdcHAC4+hFI+Ml0EZB7cdcW75stemR3qqVdqfQ52YXDUo7XBAuMNGe
	zbQKhojjtyv+0yYPp9m57d6ey35CR50VptcPzeDomPSUi7NIZVcDY9jT0hgF8LESy
X-Received: by 2002:a05:600c:3502:b0:426:654e:16d0 with SMTP id 5b1f17b1804b1-427f9380a09mr13236255e9.0.1721819143486;
        Wed, 24 Jul 2024 04:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxcMGKY8DkXH+VZwvRriZpNyoiNTR3G0Q7z17mDcBvoMBd5whWp1UW3asAiHFZnU7gpcvMZQ==
X-Received: by 2002:a05:600c:3502:b0:426:654e:16d0 with SMTP id 5b1f17b1804b1-427f9380a09mr13235935e9.0.1721819142801;
        Wed, 24 Jul 2024 04:05:42 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f4:6083:a67a:e8a9:2855:2683])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f94111c1sm24703545e9.40.2024.07.24.04.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 04:05:42 -0700 (PDT)
Date: Wed, 24 Jul 2024 07:05:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240724065845-mutt-send-email-mst@kernel.org>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <20240724104537.5632obtaek7yr4ct@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240724104537.5632obtaek7yr4ct@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 24, 2024 at 04:15:37PM +0530, Viresh Kumar wrote:
> On 11-07-24, 13:18, Viresh Kumar wrote:
> > The virtio documentation currently doesn't define any generic
> > requirements that are applicable to all transports. They can be useful
> > while adding support for a new transport.
> > 
> > This commit tries to define the same under a new Appendix section.
> > 
> > Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > V6->V7:
> > - Remove parts that talk about accessing content of the virtqueue.
> 
> I have tried to simplify the requirements now based on the discussion over the
> list. Do they look better now ?

I don't know do you keep talking about "pair" everywhere. Just say
"the device and the driver" or "a device and a driver" as apporpriate.
And in many cases it is actually just one of these.

> 
> diff --git a/newtransport.tex b/newtransport.tex
> new file mode 100644
> index 000000000000..8f7a21dc64e2
> --- /dev/null
> +++ b/newtransport.tex
> @@ -0,0 +1,37 @@
> +\chapter{Creating New Transports}\label{sec:Creating New Transports}
> +
> +Devices and drivers can use different transport methods to enable
> +interaction, for example PCI, MMIO, or Channel I/O. The transport
> +methods define various aspects of the communication between the device

so communication or interaction?

> +and the driver, like device discovery, exchanging capabilities,

"like" is informal english. do you mean "including"?

> +interrupt handling, data transfer, etc. For example, in a host/guest
> +architecture, the host might expose a device to the guest on a PCI bus,
> +and the guest will use a PCI-specific driver to interact with it.

what is "PCI-specific"? mean "a pci device driver"?
> +
> +This section specifies the mandatory requirements that any transport
> +needs to implement.
> +
> +\section{Transport Requirements}\label{sec:Creating New Transports / Transport Requirements}
> +
> +A transport provides a mechanism to implement configuration space
> +between a pair of device-driver.

configuration space is not "between".

> +
> +A transport provides a mechanism for a pair of device-driver to
> +communicate virtqueue configurations and virtqueue memory location.


this is only communicated one way

> +
> +A transport provides a mechanism for the driver to identify the device
> +type.
> +
> +A transport allows one or more virtqueues for a given device-driver
> +pair.

no idea what does virtqueues for a pair mean.

> The number of virtqueues per pair are governed by the individual
> +device protocol.

what is device protocol?

> +
> +A transport provides a mechanism for the device and driver to notify
> +each other, for example regarding availability of a buffer on the
> +virtqueue.

notify should be more specific. about vq events?
this is only notified one way, not "each other".

> +
> +A transport provides a mechanism for the driver to initiate a reset of
> +the device.
> +
> +A transport provides a mechanism for the driver to read or modify the
> +device status.

I don't think reading status is strictly required, except for
FEATURES_OK bit.

-- 
MST

