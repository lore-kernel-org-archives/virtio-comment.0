Return-Path: <virtio-comment-return-7867-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37805CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 11:20:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 79C7642D6D
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 11:20:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5D6E09868E9
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 11:20:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 528949868DE; Thu, 19 Oct 2023 11:20:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 84E6A9868DF
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 11:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8yAHaCWaNn-19FJ8Eq13CQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697714377; x=1698319177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KPPkzkyOHe8lgJCE2K+OBlRiqiWjtc6mjWikPe/q1N4=;
        b=NpP1GUXT3q+vFGKm9paE8q+gXz89jK5dzCzapjUUsoffvF0oz8elNX8mAQ6XqlbkWU
         JFeQDDhGthoPy7vnbBT8iwWBpvp3wyXe1HbcH/Yj2ml7YGOqEtKAOFU9xC8026L0nq8X
         UQ0GzpvYesQF2ljTXDcAnHRVGJScAvGynPV4XISBXgumnc7giwA6PziKEMxY+opY7fqn
         Nn9HUb3bzuJ4gY9td/0IG+DgIuod8IPytm+NC5av+Gc26fRaBawG1cR6sFq6oTS5vi4/
         tEMXeq6CETlinDE4/D9FTZzukquHESskoDv4s+/9lXvLT2Q4q4avBLxjyGTStFHx6IGx
         v9Mw==
X-Gm-Message-State: AOJu0Yx+E/aUoT+KgFdzgyGPDEx0kA8fz10fUj0bJM9Y0SXKZ+CZEPSE
	02l2Mxk+6pS/GWJHSpheuoRyygaJgP5jUKJ3meVUgPHr7Pl7fxPL0KxgwAM3huMM0s6Y8UKAGbw
	FKLcAMfg+g0W8EKXyLnEiNyYpWjrnAakaog==
X-Received: by 2002:a5d:6948:0:b0:32d:9e72:659d with SMTP id r8-20020a5d6948000000b0032d9e72659dmr1219873wrw.63.1697714377285;
        Thu, 19 Oct 2023 04:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxHqgFQ3yR/uFYarIZYPMYyjVUKZt7S5rBJLzhMnHQOpve49N7YH+SPsPtjD+U6hReDuZp/g==
X-Received: by 2002:a5d:6948:0:b0:32d:9e72:659d with SMTP id r8-20020a5d6948000000b0032d9e72659dmr1219861wrw.63.1697714376934;
        Thu, 19 Oct 2023 04:19:36 -0700 (PDT)
Date: Thu, 19 Oct 2023 07:19:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231019070411-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Thu, Oct 19, 2023 at 10:33:15AM +0000, Parav Pandit wrote:
> > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > Sent: Thursday, October 19, 2023 2:48 PM
> > 
> > On 10/19/2023 5:14 PM, Michael S. Tsirkin wrote:
> > > On Thu, Oct 19, 2023 at 09:13:16AM +0000, Parav Pandit wrote:
> > >>> Oh, really? Quite interesting, do you want to move all config space
> > >>> fields in VF to admin vq? Have a plan?
> > >> Not in my plan for spec 1.4 time frame.
> > >> I do not want to divert the discussion, would like to focus on device
> > migration phases.
> > >> Lets please discuss in some other dedicated thread.
> > > Possibly, if there's a way to send admin commands to vf itself then
> > > Lingshan will be happy?
> > still need to prove why admin commands are better than registers.
> 
> Virtio spec development is not proof based approach. Please stop asking for it.
> 
> I tried my best to have technical answer in [1].
> I explained that registers simply do not work for passthrough mode
> (if this is what you are asking when you are asking prove its better).
> They can work for non_passthrough mediated mode.
> 
> A member device may do admin commands using registers. Michael and I are discussing presently in the same thread.
> 
> Since there are multiple things to be done for device migration, dedicated register set for each functionality do not scale well, hard to maintain and extend.
> A register holding a command content make sense.
> 
> Now, with that, if this can be useful only for non_passthrough, I made humble request to transport them using AQ, this way, you get all benefits of AQ.
> And trying to understand, why AQ cannot possible or inferior?

I think the real limitation is with the SRIOV group type. If using PASID
instead of source id for isolation then we'd need a new group type.
And maybe a simpler interface than virtqueue since it's all
slow path anyway.


> If you have commands like suspend/resume device, register or queue transport simply don’t work, because it's wrong to bifurcate the device with such weird API.
> If you want to biferacate for mediation software, it probably makes sense to operate at each VQ level, config space level. Such are very different commands than passthrough.
> I think vdpa has demonstrated that very well on how to do specific work for specific device type. So some of those work can be done using AQ.
> 
> [1] https://lore.kernel.org/virtio-comment/870ace02-f99c-4582-932f-bd103362dae9@intel.com/T/#m37743aa924536d0256d6b3b8e83a11c750f28794


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

