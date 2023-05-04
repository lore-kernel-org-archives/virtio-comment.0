Return-Path: <virtio-comment-return-5770-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F47C7EE21
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 10:05:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 269DB33097
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 10:05:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F90B9866AE
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 10:05:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EFF80983EB5; Thu,  4 May 2023 10:05:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74DBB98663F
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 10:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 02csEXsLO3C0qXmfRaKjbQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683194717; x=1685786717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cxUUNFaRpaQuGosLRscgU0JCJ8AFCgoc39Txr9dD8o=;
        b=Cd1IIudG6RgE40pO4TFwd9204JVhsp9M7U4BU3+oxVJIeL34tXx4KOmie1CPjQvXhO
         YANNqe6x2FphIQxBhrk4r9v6UcvmZA0BY33DV/LciS2fPD62WVtBN/Sdp5P5SHY2TUhH
         syh81LfF1Xi2l0VcJ/C2gm1apXRC1XgRHsLDtJ3nY+VOrOnhitjW59TCFjkhcPDehw9o
         AVgmmFzwQEFMKqD7pusDBk3GK5R++Bq9oP8pyiKTNQQufxmgVZ8Rs2NVTIXUo7SZyUEn
         EVWkV8X1Nv1vdbRf6gvqOs2x0U/IIXQl9BMnEV5H4hMSzudL05J8CePMJxLWy7Kun7HO
         Sm7A==
X-Gm-Message-State: AC+VfDyEJUadniqz03kvBK3wcrn7uT3i4Bp34Z5yE86emawcnYls/vC5
	S7DzIYg/qI04p3vT/Fo8oJpJu88lKyEGDeUBD5WHPNMbSOyfhZQlUlZUDN8bZ0dhbB6A1lLlrnB
	1ALQbqGsAeceC0I0hgsSAWprTYHwVyWOdgA==
X-Received: by 2002:a5d:660a:0:b0:305:fbfb:c7d7 with SMTP id n10-20020a5d660a000000b00305fbfbc7d7mr1898375wru.44.1683194717108;
        Thu, 04 May 2023 03:05:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4oT8JjnJFlROkPEZ4nVwyQvTGxKmYqEljZ7N4Q6kQOy0r+UyKX8m8pbn7W7+37M5waPKwy/w==
X-Received: by 2002:a5d:660a:0:b0:305:fbfb:c7d7 with SMTP id n10-20020a5d660a000000b00305fbfbc7d7mr1898351wru.44.1683194716706;
        Thu, 04 May 2023 03:05:16 -0700 (PDT)
Date: Thu, 4 May 2023 06:05:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: David Hildenbrand <david@redhat.com>, parav@nvidia.com,
	stefanha@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230504060313-mutt-send-email-mst@kernel.org>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-2-pizhenwei@bytedance.com>
 <13c0e109-8d21-5294-6bd5-8f6fd6f707d2@redhat.com>
 <1a0b973a-11b0-6b24-f118-902a5809f7d1@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <1a0b973a-11b0-6b24-f118-902a5809f7d1@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: Re: [virtio-comment] [PATCH v2 01/11] transport-fabrics:
 introduce Virtio Over Fabrics overview

On Thu, May 04, 2023 at 05:46:46PM +0800, zhenwei pi wrote:
> 
> 
> On 5/4/23 16:57, David Hildenbrand wrote:
> > On 04.05.23 10:19, zhenwei pi wrote:
> > > In the past years, virtio supports lots of device specifications by
> > > PCI/MMIO/CCW. These devices work fine in the virtualization environment.
> > > 
> > > Introduce Virtio Over Fabrics transport to support "network defined
> > > peripheral devices". With this transport, Many Virtio based devices
> > > transparently work over fabrics. Note that the balloon device may not
> > > make sense. Shared memory regions won't work.
> > 
> > Anything that involves memory (memory balloon, memory device, shared
> > memory) is fully incompatible I would guess.
> > 
> 
> Hi,
> 
> Agree that memory device and shared memory is incompatible.
> 
> But memory balloon device, I don't know if it's possible to use in future.
> As far as I can imagine: a user process runs virtio-of target by listening
> localhost, and memory balloon isolates same pages from kernel, the user
> process maps these physical pages into virtual memory ...

I don't see anything big that is wrong with balloon. device inflates
balloon, this memory is stolen from guest. isn't this what user
wanted? presumably there's a way for device to send this
information to the hypervisor otherwise it seems kind of
pointless.

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

