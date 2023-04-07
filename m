Return-Path: <virtio-comment-return-5308-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932DFC6FD1D
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:27:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DEFF942B65
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:27:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D37B59865DD
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:27:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C87B0983F7B; Fri,  7 Apr 2023 11:27:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7B729865D7
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Apr 2023 11:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ORE2ham_N46YvUCBPpnKng-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680866829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3vzFtjJa1lMxhhQClLahkS2HrYMLpqXhDpodpWt7tE=;
        b=aA77aeDQQdCp+oxGUCbQDnVXso8ZvSvfsKuKXoHOJW8bEh0eQ/TaXLDFi0cE5gE7qA
         TGkxD9lmmP1CbvIfQiQfcq+6fjscxWa8jOGGGaSkih216XlqISPZ1/upFZU2KytrnB/8
         ccR3c5uvzwpML/P3oE14MxPgKGZwddHIXnM+i9EFUgQ825OqgHZRURAUozxNDMuKn4KL
         V1RrTHzG7cS239iu19tf1Ykgj6KJbCZSRdT0Cga3LbgplahGcSNlre4II5/pO4fuq5tA
         ehCncRRDqFIjxWV14Nx4rgkBy6tbGZjLlTv0e7qLI1vPdcVcIJ/UAUmVN9JDR3eiGZlf
         IDyw==
X-Gm-Message-State: AAQBX9dw1493IzM+lAgDA20zkhMg4SJ0ECurNViQ4xjHBYswSurWWdHr
	KLLgLvgPTKDDiHh2L4ukR5UvMgnJVHjIpyI9tKgHuttfddQun1eFO46HxHxg06sbs8qHAmVLXD1
	8TqKXomWuYYg3nV3DCzANaizuDy5y1lkIWw==
X-Received: by 2002:adf:ee02:0:b0:2e5:56f8:61fc with SMTP id y2-20020adfee02000000b002e556f861fcmr1293906wrn.15.1680866829525;
        Fri, 07 Apr 2023 04:27:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZTZTaktPClLsP2LVa544d3obo+u2aYitmFLQGxJqhn2eKTgCjdFLm+eExl22+Yg/oHIK788w==
X-Received: by 2002:adf:ee02:0:b0:2e5:56f8:61fc with SMTP id y2-20020adfee02000000b002e556f861fcmr1293893wrn.15.1680866829180;
        Fri, 07 Apr 2023 04:27:09 -0700 (PDT)
Date: Fri, 7 Apr 2023 07:27:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Cc: virtio-comment@lists.oasis-open.org
Message-ID: <20230407072507-mutt-send-email-mst@kernel.org>
References: <20230406073002.3642873-1-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20230406073002.3642873-1-stevensd@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [RFC] Define a low power state for devices

On Thu, Apr 06, 2023 at 04:30:02PM +0900, David Stevens wrote:
> This RFC defines a low power state for virtio devices, to gives
> drivers an option for power management besides simply resetting their
> device.
> 
> This patch is a draft aimed at starting a discussion, rather than being
> a finalized patch.
> 
> To provide some context on where this is coming from, I'm working on
> reducing the power overhead of ARCVM (virtualized Android running on
> ChromeOS). One of the big gaps in ARCVM power management is that it does
> not implement Android's partial wake locks - i.e. the (virtualized) CPUs
> are always on, even if the (virtualized) screen is off. This means we
> can't force apps to stop running when they shouldn't be running, which
> can lead to higher power consumption compared to the ChromeOS baseline.
> 
> Partial wake locks are built on s2idle, but unfortunately the current
> power management of virtio drivers does not let us use s2idle. The fact
> that power management is based around resetting the virtio device means
> that it doesn't work with stateful devices (e.g. virtio-fs). Even for
> stateless devices, re-initializing all of the devices takes longer than
> we would like, especially on lower end hardware.
> 
> My rough idea for how to address this would be to make the existing
> virtio power management targeted at S4 specifically (i.e. the freeze
> device callback). For S0/S1/S3 (i.e. the suspend device callback), this
> new lighter weight low power state would be used if available -
> otherwise it would fall back to the existing S4 power management code.
> 
> I have a very rough prototype that seems to work, and I haven't seen
> anything that makes me think this approach is fundamentally unworkable.
> That said, I would like to get feedback on the approach earlier rather
> than later.
> ---
>  content.tex | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index cff548ab9675..01da6f62ef20 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -449,6 +449,28 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
>  types. It is RECOMMENDED that devices generate version 4
>  UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
>  
> +\section{Low Power Mode}\label{sec:Basic Facilities of a Virtio Device / Low Power Mode}
> +
> +A virtio device can be put into a low power state when the
> +VIRTIO_F_LOW_POWER bit is negotiated. How a driver puts a
> +device into a low power state is transport specific.
> +
> +In general, a virtio device in a low power state should
> +avoid initating any communication with the driver. However,
> +certain device-specific functionality is exempt from this
> +requirement. Such functionality is detailed in the device
> +type specifications.
> +
> +% One example of such functionality would be allowing
> +% the virtio-net device to wake up the guest to deliver
> +% incoming network packets.
> +
> +While a virtio device is in a low power state, it should
> +maintain any type specific state in such a way that it is
> +able to immediately resume functioning upon leaving the low
> +power state, without the need for any additional
> +communication with the driver.
> +
>  \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
>  
>  We start with an overview of device initialization, then expand on the
> @@ -803,6 +825,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>    that the driver can reset a queue individually.
>    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}.
>  
> +  \item[VIRTIO_F_LOW_POWER(41)] This feature indicates
> +  that the driver can put the device into a low power mode.
> +  See \ref{sec:Basic Facilities of a Virtio Device / Low Power Mode}.
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}

So what purpose does this flag serve exactly?  I guess transports also
provide ways to enumerate supported power states, no?

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

