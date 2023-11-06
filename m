Return-Path: <virtio-comment-return-8195-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25902C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:36:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 89AF92CAD1
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:36:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 84630986727
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:36:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7B6D298670A; Mon,  6 Nov 2023 09:36:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6E2C1986712
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 09:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: oCmpQ5ceO8iwRy5Y88XTPA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699263363; x=1699868163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6HKgRc0hEUiZJCz5YgYJ94tAk/1LkX8UOkr1Mx1xd8=;
        b=wE20y7uRlOUENc3FMoQMv2qR3NONuWx6hb8WJykweKw9ly+7Hwi62nHwe+8x50uicB
         zOHGXlc2BfA67np2MSXrjV5P1wg9YIhPGlQZPgkVf8vnBNq9Ef3TEFsUFdRmMoV1ilTP
         KyIkaV0VKPFNshzm11dPQVKOriTnHJHec+xgYBqqLaw+VLRs6KkHRJBB7R/Mj7tOBe3L
         KrZfT1Dv5Y/MMBlGRFiciCFq4Sn2kZ/owujEj4kxpqKcBiKIt7jdPzZBs5c32Ui231+q
         wVi9EZM22R9o1WSo25oexx6Alir7Klz8FzjpoQu5x7vjEFB/4XoaWbnMnFcyPXN/94D4
         h0gQ==
X-Gm-Message-State: AOJu0Yy5/O6netWxCEmq/NQvrmELlKFugtsfR890DOlXe6cfwjbgipWy
	5nENEXD+zm84D7FzeWrTbHs90PjpyvU9RoRySzNW8ffawPwRISQhnWKBvWb38jKCIWOPGfuJPyj
	iwxqgaBBQ5pDcTHLxcDMnOpu9g5gD5BFMxg==
X-Received: by 2002:a5d:59a5:0:b0:32f:78dc:ecd7 with SMTP id p5-20020a5d59a5000000b0032f78dcecd7mr22868331wrr.48.1699263363317;
        Mon, 06 Nov 2023 01:36:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgtC8lwKUn5OkTRpDULx+qTYEe4YwzvyxHTNDjbzgMVQ2zQgC4T0thBv6Zgn0zCEurwlT42w==
X-Received: by 2002:a5d:59a5:0:b0:32f:78dc:ecd7 with SMTP id p5-20020a5d59a5000000b0032f78dcecd7mr22868311wrr.48.1699263362951;
        Mon, 06 Nov 2023 01:36:02 -0800 (PST)
Date: Mon, 6 Nov 2023 04:35:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231106042108-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-2-lingshan.zhu@intel.com>
 <20231103065138-mutt-send-email-mst@kernel.org>
 <d2f3c5cd-0376-460a-9230-4098863f1bb7@intel.com>
MIME-Version: 1.0
In-Reply-To: <d2f3c5cd-0376-460a-9230-4098863f1bb7@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 1/6] virtio: introduce virtqueue state

On Fri, Nov 03, 2023 at 10:49:42PM +0800, Zhu, Lingshan wrote:
>         +When SUSPEND is set, the device MUST record the Available State of every enabled splited virtqueue
>         +in \field{Available State} field,
>         +and correspondingly restore the Available State of every enabled splited virtqueue
>         +from \field{Available State} field when DRIVER_OK is set.
>         +
>         +The device SHOULD reset \field{Available State} field upon a device reset.
> 
>     At this point I have no idea
>     - how can a state of a virtqueue at a random time be represented
>       by a 16 bit integer
> 
> not sure what is a random time, this is to request the device to reset
> its avail state, for example, it is "le16 queue_avail_state" in virtio-pci
> common cfg. Resetting this so the device will not recover from a wrong value of
> the last run.

You simply never bother to say what is "Available State" and what
does it mean to restore it.  Not to mention words like "splited"
which just adds to the confusion.

>     - if it's not at a random time then why do you even need an integer -
>       synchronize queue to memory and then all state is in memory
> 
> Not sure what is a sync queue, but for example, "le16 queue_avail_state" for
> PCI transport exists in a cap.

I just point out that normally a lot of ring state is in memory.
So you need to be much more specific about how you are augmenting that.
For example, if buffers are used exactly in order for a split ring
then used index seems to be exactly the same as last available index
you describe - it's a free running counter. OTOH if they are not
used in order then I don't see how is a single index sufficient to
describe which ones have been used and which not.


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

