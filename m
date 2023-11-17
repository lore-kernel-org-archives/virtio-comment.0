Return-Path: <virtio-comment-return-8416-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DBAC197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 08:46:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3B567790E8
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 08:46:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F68A986E20
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 08:46:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F3523986E18; Fri, 17 Nov 2023 08:46:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF5C3986E19
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 08:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: SQwDTpb_N8eWDbFooQLs-Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700210782; x=1700815582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LYNCCUjwz76RF7UpQ9SiebGZk9P6OHamRFQ2rH8iC0=;
        b=kdiNIybhe2/OwSuTKvkauUMbUPC1hCx8mHLuGZoT5x0r3Uy7JNBo9yAn0kZw61cyUY
         u67AuN13/ZIt6bsCYMbhwJMIavyNLrhUCEsPk2SP+NszIYKe9FBLe0voa9ZvoIiyZq9K
         KZxNUB9SOIX+IBMRHZwnVbY4bkfuHWkJ1J872pgvdOtVbj7iL4nB6k8BPIvYKmKmrlyJ
         BjiDlJAmROr/aNEx1mc4wY3BtOO0tFD81cgAwloUMv8qAz6gbD+eE3ywLL0HJvMeSup0
         kHUaALn3qWfXQGBE1H71HwPA98p5G4aJ4bjx0EC3ePEWnnQJPrNnj56e1mU+eRufZNDa
         iwew==
X-Gm-Message-State: AOJu0YxAp3xjeyN+HDlQ8uM8SHJ84t7qMAkWwT2crcjJzhqqKbd3IxNj
	1nSsC3Lq6zwkJ+oUvC6EJwTL63k0wSZ2coTRTQkvUVo6zkcI5sf979u4gyE7EIOfU4oTjwZ3Uzo
	7XovRj9detCu6KVoV4PmfkInPU0nO2fbACw==
X-Received: by 2002:adf:ffcd:0:b0:32f:93b0:66f8 with SMTP id x13-20020adfffcd000000b0032f93b066f8mr11716879wrs.26.1700210782188;
        Fri, 17 Nov 2023 00:46:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcsufJewPjCsJB8LdloDHLmLUknYZ/AXykXP+9XLokRbgHZYlV+2vLKQvpmP33TqaZDyJmVw==
X-Received: by 2002:adf:ffcd:0:b0:32f:93b0:66f8 with SMTP id x13-20020adfffcd000000b0032f93b066f8mr11716867wrs.26.1700210781783;
        Fri, 17 Nov 2023 00:46:21 -0800 (PST)
Date: Fri, 17 Nov 2023 03:46:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231117031251-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Fri, Nov 17, 2023 at 03:02:20AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, November 16, 2023 11:51 PM
> > 
> > On Thu, Nov 16, 2023 at 05:29:49PM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, November 16, 2023 10:56 PM
> > > >
> > > > On Thu, Nov 16, 2023 at 04:26:53PM +0000, Parav Pandit wrote:
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Thursday, November 16, 2023 5:18 PM
> > > > > >
> > > > > > On Thu, Nov 16, 2023 at 07:40:57AM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > Sent: Thursday, November 16, 2023 1:06 PM
> > > > > > > >
> > > > > > > > On Thu, Nov 16, 2023 at 12:51:40AM -0500, Michael S. Tsirkin wrote:
> > > > > > > > > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > > > > > > > > > We should expose a limit of the device in the proposed
> > > > > > > > WRITE_RECORD_CAP_QUERY command, that how much range it can
> > > > track.
> > > > > > > > > > So that future provisioning framework can use it.
> > > > > > > > > >
> > > > > > > > > > I will cover this in v5 early next week.
> > > > > > > > >
> > > > > > > > > I do worry about how this can even work though. If you
> > > > > > > > > want a generic device you do not get to dictate how much memory
> > VM has.
> > > > > > > > >
> > > > > > > > > Aren't we talking bit per page? With 1TByte of memory to
> > > > > > > > > track
> > > > > > > > > -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > > > > >
> > > > > > > > Ugh. Actually of course:
> > > > > > > > With 1TByte of memory to track -> 256Mbit -> 32Mbit ->
> > > > > > > > 8Mbyte per VF
> > > > > > > >
> > > > > > > > 8Gbyte per *PF* with 1K VFs.
> > > > > > > >
> > > > > > > Device may not maintain as a bitmap.
> > > > > >
> > > > > > However you maintain it, there's 256Mega bit of information.
> > > > > There may be other data structures that device may deploy as for
> > > > > example
> > > > hash or tree or something else.
> > > >
> > > > Point being?
> > > The device may have some hashing accelerator or other improvements that
> > may perform better than bitmap as many queues in parallel attempt to update
> > the shared database.
> > 
> > Maybe, I didn't give this thought.
> > 
> > My point was that to be able to keep all combinations of dirty/non dirty page
> > for each 4k page in a 1TByte guest device needs 8MBytes of on-device memory
> > per VF. As designed the query also has to report it for each VF accurately even if
> > multiple VFs are accessing same guest.
> Yes.
> 
> > 
> > > >
> > > > > And this is runtime memory only during the short live migration
> > > > > period of
> > > > 400msec or less.
> > > > > It is not some _always_ resident memory.
> > > >
> > > > No - write tracking is used in the live phase of migration. It can
> > > > be enabled as long as you wish - it's a question of policy.  There
> > > > actually exist solutions that utilize this phase for redundancy, permanently
> > running in this mode.
> > >
> > > If such use case exists, one may further improve the device implementation.
> > 
> > Yes such use cases exist, there is no limit on how long migration takes.
> > So go ahead and further improve it please. Do not give us "we did not get
> > requests for this feature" please.
> 
> Please describe the use case more precisely.  If there is any
> application or OS API etc exists, please point to it where would you
> like to fit this dirty page tracking beyond device migration.  We may
> have to draw a line to have reasonable point and not keep discussing
> infinitely.


What I had in mind was fault tolerance e.g. the abandoned Kemari
project.  Even just with KVM people tried several times so we know
there's interest.

In any case you can safely assume that many users will have migration
that takes seconds and minutes.

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

