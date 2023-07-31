Return-Path: <virtio-comment-return-6934-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E2FC001DF
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 09:13:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5CB4842C2D
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 09:13:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4BE35986410
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 09:13:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 419CE98636F; Mon, 31 Jul 2023 09:13:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F87998637C
	for <virtio-comment@lists.oasis-open.org>; Mon, 31 Jul 2023 09:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: WiLey--6OBOVxfjiyLJKoQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690794793; x=1691399593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpaIMjB5xKrspjz9EZT5Go05akNFwr+J4PZNOBaKhEg=;
        b=co21QGySvqsKp9/V0cWos/opJUoRm4hskjcsXWjYYVi6UyhxS7myBs1qlczgy6ll1L
         2nplKgPw4OOKCtUDpZY7ADdkXVZc+fYmtKS81MmjWqbT8+akiJQV4PI0lTal1NHb+Ys9
         AoLlcouzdkkLr7drt1WR30hEDP9MNhv8WN9oqBj4bC7dZynodo7m4gO34pmP17QcwHno
         VdWDMDBz9d8/clNZRySLUPxgAn+R2zE1UGpc0sQFNxCL35i7BvYRn2UzVqhmz8cZzHH3
         ymvb7E5VAiblJkg/pN3NXx4ena9rccXD76SQwkJFowklNABPkR8ew5ThEHlzEhloWYIK
         gxhg==
X-Gm-Message-State: ABy/qLYL0EgBom28wpg2q1qcb1kbV5yzkCiLQIp8j7Z5aZlFUr5mG99B
	MFECD3DF3zxG3n/hes/GDHTe1oTwZr+ZZ91Y3RSPwRHWoHivKem949nbY7oHsNjxY3uIUicRlYI
	6UEh1d+EhhjtufQx+Q2Guto6rqTaZX7YkjQ==
X-Received: by 2002:a05:6512:718:b0:4fd:d538:b97b with SMTP id b24-20020a056512071800b004fdd538b97bmr4715640lfs.29.1690794792841;
        Mon, 31 Jul 2023 02:13:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHLfcCf0ZyPvA4HmBJEZEd2OTZz+nAHZqini7MnjX7tsuRVJKYaa4gFlnoQzVjQ+hi9ruqX2w==
X-Received: by 2002:a05:6512:718:b0:4fd:d538:b97b with SMTP id b24-20020a056512071800b004fdd538b97bmr4715626lfs.29.1690794792462;
        Mon, 31 Jul 2023 02:13:12 -0700 (PDT)
Date: Mon, 31 Jul 2023 05:13:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230731051230-mutt-send-email-mst@kernel.org>
References: <20230726081229.55947-1-xuanzhuo@linux.alibaba.com>
 <20230726070801-mutt-send-email-mst@kernel.org>
 <1690422490.8491526-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB548149ED4C687913EDA3EED9DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1690782610.3048255-3-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481F2D5FA4BA77DD0A08192DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481F2D5FA4BA77DD0A08192DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: RE: [PATCH v13] virtio-net: support device stats

On Mon, Jul 31, 2023 at 06:19:14AM +0000, Parav Pandit wrote:
> 
> 
> > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Sent: Monday, July 31, 2023 11:20 AM
> > I will keep pushing this, if your proposals affect this, I will fix it in a furture
> > version.
> 
> We need the bitmap indicating which counters supported which are not.
> And those to be queried via dma interface.
> So this counters proposal has direct dependency on dma interface to work first.

my hope is we can switch all of config space to dma.

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

