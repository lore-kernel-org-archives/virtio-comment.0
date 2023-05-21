Return-Path: <virtio-comment-return-5983-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93062C7EE23
	for <virtio-comment@archiver.kernel.org>; Sun, 21 May 2023 05:57:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 46614370E6
	for <virtio-comment@archiver.kernel.org>; Sun, 21 May 2023 05:57:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 118D39862A1
	for <virtio-comment@archiver.kernel.org>; Sun, 21 May 2023 05:57:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 03D199859E7; Sun, 21 May 2023 05:57:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E15059859E9
	for <virtio-comment@lists.oasis-open.org>; Sun, 21 May 2023 05:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KoYI9ORSMU6OlqIfhhJDJw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684648667; x=1687240667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neEnWwdBJs1CHdHlkglta2HaEq1W3RW8Zwqq2ZQfi78=;
        b=Y0vsaHkqRway8oEZ+H9rKNXRxs0T4GOQRDmNXrriBFRrsRf6NxYgIy8VkhiBPRwWo7
         UHX7srxCf6cOsnIGawCeixS9xKpBTkURulJ9zU/sAu+h+zWPQ24LXEeeO4TG45xTYjTY
         Mazm/7EArc6R1rEzIWhJU/YkBnteeUew1gDA8trqztGAE9tPv4SqRzHKzb/HmbSuo1g+
         JQ9hPZL9yceXqybOpq+qUjGCi9pOpEMJLHRfr/c4l3UADGbjdUyWJQRcLAzV2KZxIBwF
         bHWTM0t08iEuUkGWLhAOlC5UAZ8Uu7gzZDubIBMIZNj9DRC1SYK144M41a50HLR+PMPu
         ziFw==
X-Gm-Message-State: AC+VfDxS6fqSDqXaRRfpHORT4VtBfJ1hSNJFbqc9CcCp/05kSvwHI/ch
	+GYgqxIlyrcZ+FRD/y0VqQT21uiiccrO14G+umc5QeBz58Onw+ZYj4OWTWWRL/WrNEFzXrbl+2q
	Pzr2D1gpYx2VdLbwCDD2HRyxQWjk01GeUhg==
X-Received: by 2002:adf:f409:0:b0:2fe:e137:dbad with SMTP id g9-20020adff409000000b002fee137dbadmr4251127wro.51.1684648666849;
        Sat, 20 May 2023 22:57:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7jJX+90+JUA0pXXmGVdq7vGbr8TYXK9Jix6Ol6UlmCNNudlg5fjcjSHvJ8vjbQeVQVz9sJ/g==
X-Received: by 2002:adf:f409:0:b0:2fe:e137:dbad with SMTP id g9-20020adff409000000b002fee137dbadmr4251119wro.51.1684648666498;
        Sat, 20 May 2023 22:57:46 -0700 (PDT)
Date: Sun, 21 May 2023 01:57:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230521015236-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-9-parav@nvidia.com>
 <20230519020737-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E912A8CDE621DF4344DEDC7C9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E912A8CDE621DF4344DEDC7C9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 08/11] transport-pci: Introduce virtio extended capability

On Fri, May 19, 2023 at 09:02:58PM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, May 19, 2023 2:10 AM
> > 
> > So looking at this in isolation, it probably warrants an extra github issue. So I
> > would like to find out whether we should introduce this capability and switch to
> > it for new devices.
> > 
> > My main question is whether e.g. seabios will be able to use it.
> > Could you take a look at the source and let us all know?
> > 
> Existing unmodified seabios cannot use it because it is not looking at the new offset and cap_id.

Yes but neither can it support new devices because it does not look
for the new device id. So it's fine - I was talking about new devices
using extended capability.

We shouldn't just laser-focus on existing software and devices,
there's probably more to come.


> But that is the case with any existing software, not just seabios.
> 
> New capability is in addition to the existing one.
> And code already exists to refer to the old one, so I am not seeing any gain to create them now.
> Any new capability that one creates in the future can be in the extended area.

Question is about MCFG in general.  Is adding capability to access MCFG
to seabios for pci accesses practical? hard?

> You mentioned a perf angle that it takes half the time, but I don't
> see how as the only change between legacy and ext is: offset.

For a variety of reasons Linux does not use memory mapped
accesses for legacy config space, it uses cf8/cfc for that.

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

