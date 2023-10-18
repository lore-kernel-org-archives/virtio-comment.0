Return-Path: <virtio-comment-return-7784-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA331CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:13:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1B7C268471
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:13:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E819B986894
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:13:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CFC2798688B; Wed, 18 Oct 2023 06:13:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BFA2B98688C
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 06:13:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: re7qTqnVPUWwJ-TdpzqUOA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697609600; x=1698214400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFcCbj2FMbp9dxqvo+Nkzw95lKMarHZadIvqIPXf/UU=;
        b=RRDPSyN1TlJZt8ZP0uZngqsQBLjBoM2E5OEwA8GxKo7KJ4TsnSaOHKLevLNxs+URP2
         3kmw4E65xA62i0kOtMe1co0JBOIcKKr4ikrkfqHJ533XDHZasRYmqmvuhF292y3nsHJJ
         u9Ajs12tyZutPvcyEA6SsRcy/ppEsxfT8JYJM18lUMPX6TKcBdQHiGzVjMph602yneGw
         SAtnBdJcL/OANxoWYUlAVyiRa19rZ3AYkKP78RtdRnYWVuJXDGzVTlgR3YW/xKB1/GLz
         wdu8bfTDg5FtaEnsZXrdG7gs6hyQlZlUYzcBgerZOfB1+gUi8QyZ1LMrSeAw4U7E1Ub1
         wPJg==
X-Gm-Message-State: AOJu0Yz/+1kglNNiV5GC0zy4BeKai1dV0TBHjA0QrmYbIxn7/4aefmnT
	NFVLw6tDOev0/OluLJLQ+2/Fzpg7NNf+/vw8IhoosenY95syJ71PC6UjYi6EuGlD8pU2Q+BiHaa
	U93FVfgPNkNVnxDM7EmDqdZVK10LCzTFK6g==
X-Received: by 2002:a05:600c:35cd:b0:407:39ea:d926 with SMTP id r13-20020a05600c35cd00b0040739ead926mr3334331wmq.9.1697609600120;
        Tue, 17 Oct 2023 23:13:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuIoLDvZ0mlKrl+W6wRLZPMOUt1cOJOQsIknXp12lME2ohScFjJl+8og+nFV702B44GhG97Q==
X-Received: by 2002:a05:600c:35cd:b0:407:39ea:d926 with SMTP id r13-20020a05600c35cd00b0040739ead926mr3334317wmq.9.1697609599719;
        Tue, 17 Oct 2023 23:13:19 -0700 (PDT)
Date: Wed, 18 Oct 2023 02:13:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231018020744-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuw0qvrVSLXfT2KaCX-GYiw4o9=FifcYDnDHFidGhq23Q@mail.gmail.com>
 <PH0PR12MB5481691682222F6A7E495A7DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsLSW-_dTwWD8RJn+wudQL1itDFfZZV15GH9NXy=bLbCw@mail.gmail.com>
 <PH0PR12MB5481B064B44E165949A127EFDCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuz8wyT5vkt7s+fQA7x=r92KP2886dDdzW82y7NUa9zRg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEuz8wyT5vkt7s+fQA7x=r92KP2886dDdzW82y7NUa9zRg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Oct 18, 2023 at 08:52:51AM +0800, Jason Wang wrote:
> What's more you design is incomplete as it can't be used for migrating:
> 
> 1) owner
> 2) virtio devices that doesn't structure as owner/member

Fundamentally, the alternative proposed seems to be using PASID for
sub-function partitioning. All well and good and forward looking but
there are vendors who want to actually ship hardware right now and that
means at least not ignoring SRIOV.


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

