Return-Path: <virtio-comment-return-6021-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76259C77B7C
	for <virtio-comment@archiver.kernel.org>; Wed, 24 May 2023 05:56:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DAA8C26A28
	for <virtio-comment@archiver.kernel.org>; Wed, 24 May 2023 05:56:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77A5F98642B
	for <virtio-comment@archiver.kernel.org>; Wed, 24 May 2023 05:56:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A1F99862F6; Wed, 24 May 2023 05:56:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 504BB9867E0
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 May 2023 05:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8p2-3RDUOhyhxVR6WeTghw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684907805; x=1687499805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOsJ/9P7cdkSnQKB+kehz1Ogt6Qe5WVKLgXbAkCJO4w=;
        b=BHffexSrjHLy+zp9NL8rPBJebwLO8++VOEXFfa7ekZ9JVw6D28wVVu4Qm59xa8/eUD
         qKhsx/w2QiOv/RYSkGUFH4iHlgHVl8jN4Ca2b6o/09MPr/XqwiKuANJVgm6G+T29RGEb
         WhOAxD/wispe5ga4iByTxdTvN3pO7yGNN62oqJRWsbrqo7AE457WOI8ruBum7kbkr+pP
         v7dEDN30asfH/CkxzPDLfJsRxvUc2ostLMwt+o5mVQCl9tfXw2D+eshu9W6UvlCB2BZl
         LpRrr8NFJbZUTOXtYQXdFLPQDml37Sgh2MumRMPWmtwdgAec8yXEr0YwR+ky7dcVM0Si
         ZsOg==
X-Gm-Message-State: AC+VfDwPXZRaX/I9Hn5J7E3gW4ZmBv5UwWOEhl17na1kGGWcF219ZBA6
	337V6/W9UrlZRlEz/H/5grznr5kY4qHwlbbCeTghCenkiaJOomeVH9xxZjbB65LiL+3VfoYLJLc
	y/+CDIQCrzYGO4nZbsBodKjRIdn7vlwQx2A==
X-Received: by 2002:adf:ee49:0:b0:306:3b78:fe33 with SMTP id w9-20020adfee49000000b003063b78fe33mr12534449wro.32.1684907805342;
        Tue, 23 May 2023 22:56:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6KupUQayEZUuDf2KR3FfFCOqAWR4a7zra3BMtZCdRYqNgoRlS4GMQnAjJDbnjfxX3piX7baQ==
X-Received: by 2002:adf:ee49:0:b0:306:3b78:fe33 with SMTP id w9-20020adfee49000000b003063b78fe33mr12534440wro.32.1684907805022;
        Tue, 23 May 2023 22:56:45 -0700 (PDT)
Date: Wed, 24 May 2023 01:56:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230524013429-mutt-send-email-mst@kernel.org>
References: <CACGkMEvTs9oMewgrQpYZu1v1wdUXtxsvjqB6CPRf+y4C8EN_KQ@mail.gmail.com>
 <20230510033812-mutt-send-email-mst@kernel.org>
 <CACGkMEsp0i7EyyBBp06wJzrVBLNbH7MP_TT-j7b5c_yavgAmqw@mail.gmail.com>
 <20230511085205-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812F2EFEC7B6A235953A82DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0f75a142-71e9-676a-11ae-a54e6dbb472d@redhat.com>
 <20230515060641-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817BC2F2FBFE3609AFA23CDC789@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230523141439-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E89D0E5DD6F291F8E149DC409@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E89D0E5DD6F291F8E149DC409@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Tue, May 23, 2023 at 09:32:41PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, May 23, 2023 2:17 PM
> > 
> > On Mon, May 15, 2023 at 02:30:55PM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Monday, May 15, 2023 6:09 AM
> > > > To be more specific, device config often has the same layout under
> > > > legacy and modern. Thus if getting an offset within device config,
> > > > same decoding logic should be reusable between legacy and modern.
> > > Modern device registers are directly accessible from the guest driver without
> > mediation for VF,SF,SIOV.
> > > Hence, there is no need to have commands for modern register access over
> > some VQ.
> > 
> > Yes, there's need, and some of it you were pushing yourself.
> Yes, there is need without mediation of AQ.
> It was discussed in depth cfgq idea with trade off.
> 
> > AQ will allow reduced memory with SRIOV, and support for SIOV.
> Already discussed, v0 and v1, mediation via AQ is not the way for SRIOV.
> SIOV starting with single goal of only backward compatilbity hence, AQ is also doesn't look future forward.
> 
> And your summary email, we parked it aside for now.

I am frankly lost at this point, this thread is too big.

So where do you want to go for this project?  I would like something
specific, email threads are growing too big.
I think the reason is that there is actually a host of small
related subprojects. So when you propose just this small
feature, everyone jumps in with their own pet project
proposing addressing that too.

For example:
- SIOV guys were adding transport over VQ. It would seem that
  can include support for legacy.
- For migration we need ability to report member events to owner.
  It would seem that can be used to support INT#x.
- Ability to stick capabilities in extended config space
  is a good idea, for a variety of reasons.

and so on.  Understandably frustrating, and it is easy to go overboard
with generality.

If you feel your path for progress is clear, that's good.
if not, here are ideas for getting this unstuck:
- start a TODO.md file with a list of things we need to address,
  and for each one a list of options
- everyone will add to this file then we get a higher level
  picture and can discuss "this will be addressed by A, that by B"
- have a chat at the upstream developers meeting (May 31)
  so far it's about vdpa blk
- anyone coming to the kvm forum to have a chat there?

Hope this helps.
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

