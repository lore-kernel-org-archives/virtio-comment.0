Return-Path: <virtio-comment-return-8411-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BCDC47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 17:26:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5420C77C4C
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 17:26:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 29968986E02
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 17:26:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 11BB1986DF7; Thu, 16 Nov 2023 17:26:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 01ED2986DF8
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 17:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: MrjXYxewOg-AUz7IWicP8Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700155564; x=1700760364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUPwQ9yCkZ+3QUC2UdAqxFL2UkfGQQs7kh/g/UoAOQw=;
        b=oaUIZZVb4dTPgvc4CeQ1vY9r+En6pCG1UwsQPHLL1s5rGHXWrdazjeiRiZ+fQbxEVo
         gdf9DQTNZXt9u/Fo1+uVuh1meLpGEPnt/XRrWvl9f0YEw4rVEOzsia7QFOmMr4Pe/1Do
         TLgVVyHavbfTf/BwusxoKQ7X39Uernini97SIG8jQgp2Asun/lRD1S3XowRgDPx5/guv
         F8ixb0ByYRZzTl6A3pdeIP15bmjqPfCKFR4JxUUfFoHMnTeehY1kGM588fNtNX1X87+7
         DZz97rwR20nsZsTCM7oF6JeWKIE9VAp35m1nbQ3Xrkppta7eFnZs6n01r223jzmJOf6K
         Lu8g==
X-Gm-Message-State: AOJu0YzPewcf892Rq8nFdN0MYAd3+eL7aRwgegzIyU6WP6mtjqn99uCe
	r38gE9dSjxzen+K7NQ8CMvYTgKtDqSKnykxPQPBSGB+DWyjEmBvyPh2blfVLrRFsk+d6zi+jnx6
	l/fOtze1/zp+erObZb7YlBNUFyjJStAB5HQ==
X-Received: by 2002:a17:907:7888:b0:9be:6395:6b12 with SMTP id ku8-20020a170907788800b009be63956b12mr13930721ejc.27.1700155564220;
        Thu, 16 Nov 2023 09:26:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH52AbJPrHfQYp3PS2yVZhYVGHYNK052xA2pI5YUMV55MNVMwBEB8L0RJ0CBGwNKA3QXPZ2cg==
X-Received: by 2002:a17:907:7888:b0:9be:6395:6b12 with SMTP id ku8-20020a170907788800b009be63956b12mr13930705ejc.27.1700155563909;
        Thu, 16 Nov 2023 09:26:03 -0800 (PST)
Date: Thu, 16 Nov 2023 12:25:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231116121958-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Thu, Nov 16, 2023 at 04:26:53PM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, November 16, 2023 5:18 PM
> > 
> > On Thu, Nov 16, 2023 at 07:40:57AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, November 16, 2023 1:06 PM
> > > >
> > > > On Thu, Nov 16, 2023 at 12:51:40AM -0500, Michael S. Tsirkin wrote:
> > > > > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > > > > > We should expose a limit of the device in the proposed
> > > > WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> > > > > > So that future provisioning framework can use it.
> > > > > >
> > > > > > I will cover this in v5 early next week.
> > > > >
> > > > > I do worry about how this can even work though. If you want a
> > > > > generic device you do not get to dictate how much memory VM has.
> > > > >
> > > > > Aren't we talking bit per page? With 1TByte of memory to track ->
> > > > > 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > >
> > > > Ugh. Actually of course:
> > > > With 1TByte of memory to track -> 256Mbit -> 32Mbit -> 8Mbyte per VF
> > > >
> > > > 8Gbyte per *PF* with 1K VFs.
> > > >
> > > Device may not maintain as a bitmap.
> > 
> > However you maintain it, there's 256Mega bit of information.
> There may be other data structures that device may deploy as for example hash or tree or something else.

Point being?

> And this is runtime memory only during the short live migration period of 400msec or less.
> It is not some _always_ resident memory.

No - write tracking is used in the live phase of migration. It can be
enabled as long as you wish - it's a question of policy.  There actually
exist solutions that utilize this phase for redundancy, permanently
running in this mode.

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

