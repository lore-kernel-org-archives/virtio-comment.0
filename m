Return-Path: <virtio-comment-return-5377-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB57C76196
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:01:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6CDC6603CE
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:01:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 66D309863C9
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:01:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 594F098636D; Tue, 11 Apr 2023 14:01:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 45F9798636E
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Apr 2023 14:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: BjWcGRY4NjmcOWhjw7A8-A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681221687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2JLbUUe1BmeIfMDfNz4eiRFwi4sr35xM6HAkq4/rLA=;
        b=SGzkuR0oOlf+o+fA73JzheEm2IDWu5PSiHsEUskVRBhreyB6UzPmzpFNTBXepfhlKC
         mqgra8Q4i+xZN7gDnQvmaIKL2FatUiivuEV7LNU7PydcoPcjHm18OIpAGx4FTRy4E4zJ
         PDVQkJOrVTi1MltzaQu0zslGCyTkO6RC0PFqtV4wl2/n6ZEDYgKzRgXWCaLvZd2XHr7E
         R5S7ua93OzVv4ssFLWaDCzSAJ//rVYYZ1d1LXPHqtJLxAT2z8+bJxIyHN1iGmAezgXd4
         5GRXERKW2+qSKGeRmqtMKeOkucxOXtj0lxN689XMnFfJBDZvG0Ej5IXY+hP1ntlyiX6A
         qgUA==
X-Gm-Message-State: AAQBX9f4P5x514H5DM8I86V+C0xmnhQ1VQ8SmrowLi96vPX1hzRSRZyw
	fqEbGIBl0we1tTJwAW8wKQJChUF6vbD1viRiifUgRr5vyZZASEM5pwu36aKMVEfu50sGfwEqDjx
	vVia+4/wQ6NPQMxy3xsa1LjFy/e5LVEV1vA==
X-Received: by 2002:a5d:6d49:0:b0:2d1:7ade:aac with SMTP id k9-20020a5d6d49000000b002d17ade0aacmr10684847wri.0.1681221686879;
        Tue, 11 Apr 2023 07:01:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZIt4QarGrBe8UJ9ZAMTqctyUU/IZKzgeWWpVIhQFeggeLVjEeqVFyUSM7ms/GS087Z41ElzA==
X-Received: by 2002:a5d:6d49:0:b0:2d1:7ade:aac with SMTP id k9-20020a5d6d49000000b002d17ade0aacmr10684825wri.0.1681221686494;
        Tue, 11 Apr 2023 07:01:26 -0700 (PDT)
Date: Tue, 11 Apr 2023 10:01:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"nrupal.jani@intel.com" <nrupal.jani@intel.com>,
	"Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
	"hang.yuan@intel.com" <hang.yuan@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Jiri Pirko <jiri@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230411100023-mutt-send-email-mst@kernel.org>
References: <cover.1680533760.git.mst@redhat.com>
 <9cbecf20548a7adf4d97d07b17e40eb3c1c50209.1680533760.git.mst@redhat.com>
 <2ebedc33-1fa8-1fe5-67eb-8d657cf932db@nvidia.com>
 <20230410092104-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CBA1F5A746DA89CD6BF3DC959@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230410160357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E78E40F84BBF68687F7ADC9A9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E78E40F84BBF68687F7ADC9A9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v11 04/10] admin: introduce virtio admin virtqueues

On Tue, Apr 11, 2023 at 01:39:32PM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, April 10, 2023 4:05 PM
> > > >
> > > With my limited knowledge, when written for third person doing the adding
> > entries to the queue, "enqueue" is suitable.
> > 
> > Look it up in a dictionary.
> 
> Queue is verb and noun both.
> As opposed to that enqueue is not ambiguous being only verb.
> 
> When "driver queues" is read, it needs tiny more efforts to realize that queues here is verb and not plural driver queues.
> 
> So, without strong opinion, enqueue is preferred but it's up to you.

If you feel like this feel free to change all of text to enqueue.

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

