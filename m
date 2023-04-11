Return-Path: <virtio-comment-return-5378-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2309C76196
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:02:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2BE9C68474
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:02:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 222CF98641A
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:02:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 18C0F98636D; Tue, 11 Apr 2023 14:02:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0946098636E
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Apr 2023 14:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: rTcOEhB3N-a--TMd353pYA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681221764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3wLHsbk7eNcdHKUta6QZ4bpEaniepj0YvQG5BcB9dM=;
        b=ExVAHMtd48jz17fKs0uF9+3xEOz3ZZkfWVHc1N7MZ05YwaaKyZZ6eRQRFGUUG1UI2T
         FoEL9JQgT35ansXNuf+8f8FphIgkbZKlXhYXIrsArvn0+CzIY1qFfz/US5NYezCQMn6x
         46rlar6h70BURheCzZbjPHCvhaKC7dpErNymWSvDPjkBJnh/yu7c0Epn5rZknZnOsA1l
         t6xZ7gy8Vuym3CfM/GyL0RuidPFvp5U1ohsIinlsakk2M22il4BMatMJlQFrYRb+/VE8
         fwZi8b8jHp+Q/Sz3rlVSkDn0a/U7xASX8M7Ik9p8BIgPFvRw2x0C8L0xwVVezHfhIHNX
         Jy1w==
X-Gm-Message-State: AAQBX9fMpEtlPAbQU7MdRSZVGY0GavY6M3yoKkR5XOQroTjCYWcPvB9T
	mp8/Pzfh9Mcpa3F0AgVbgEAuk1kw49+Ypr2j3fpynVqAmCRFbN2Q++C0RLodSumDOYfFIbLdWDK
	Z46pW2eqF02m8udrBi3U3sOIFpCOEF1LYgA==
X-Received: by 2002:a1c:f716:0:b0:3ef:4138:9eef with SMTP id v22-20020a1cf716000000b003ef41389eefmr10379250wmh.36.1681221763905;
        Tue, 11 Apr 2023 07:02:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350bQrouy29peDWKPL30kJDLR+yIjWgUmYEfX6O9Yn6PRnXsG7QHaGl8avM4vxGN2zVB3OXEjvA==
X-Received: by 2002:a1c:f716:0:b0:3ef:4138:9eef with SMTP id v22-20020a1cf716000000b003ef41389eefmr10379220wmh.36.1681221763560;
        Tue, 11 Apr 2023 07:02:43 -0700 (PDT)
Date: Tue, 11 Apr 2023 10:02:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-dev@lists.oasis-open.org,
	cohuck@redhat.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com, Satananda Burla <sburla@marvell.com>
Message-ID: <20230411100209-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-9-parav@nvidia.com>
 <CACGkMEtMOy4B-O-52ka+9P3OBQ_hs1KvdjWodNYg-XKLff+giw@mail.gmail.com>
 <20230410021619-mutt-send-email-mst@kernel.org>
 <CACGkMEsZXozY7iC7L3L9FC+o8dQGY9+Hhbag2Z-G-nxr9BvDdw@mail.gmail.com>
 <20230410055947-mutt-send-email-mst@kernel.org>
 <CACGkMEsKLeJ1q3Vh8h2JYM=-RcrGd+31yR1Zsw0U=SRd1JZugg@mail.gmail.com>
 <20230411025646-mutt-send-email-mst@kernel.org>
 <c6e986e2-4806-6635-5d8b-0f70c51c6b88@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <c6e986e2-4806-6635-5d8b-0f70c51c6b88@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH 08/11] transport-pci: Introduce virtio
 extended capability

On Tue, Apr 11, 2023 at 09:47:50AM -0400, Parav Pandit wrote:
> 
> 
> On 4/11/2023 3:00 AM, Michael S. Tsirkin wrote:
> 
> > > I meant, it depends on the capability semantics. Both PASID and legacy
> > > MMIO don't need to be accessed by BIOS. We can't change legacy BIOS to
> > > use legacy MMIO bars.
> > > 
> > > Thanks
> > 
> > makes sense.
> > 
> > 
> > now, imagine someone building a new device. if existing drivers are not
> > a concern, it is possible to move capabilities all to extended space. is
> > that possible while keeping the bios working?
> > 
> unlikely as bios is looking in the legacy section.

what do you mean by the legacy section?

> New capabilities like legacy (and pasid) has no backward compat requirement
> from bios and drivers.
> so they can start from new.

sure.

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

