Return-Path: <virtio-comment-return-6962-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8807C04E69
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:26:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EAAD67C6A8
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:26:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E4022986689
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:26:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DAD5298660F; Wed,  2 Aug 2023 11:26:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C58E798663F
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Aug 2023 11:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3Wu-DITROQ2a3c3S9UXuMQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690975560; x=1691580360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DnDwadgKaqyFFtQVzC1P9h6UPf7H3NvgesIm9rNOGI=;
        b=RXphq5JpWXIbo+QagaqdSuaEtL8xbkzW7MQ3H4o2X2za/D+6DN61xA0SMWZJpIvziP
         1cAlqxY+V0/yqqJnylLCzPjHqVhEujyyNfBz0Fq27dGO61gVAeVs5Q0JjeKJiigCq+Oh
         8LW8ZqhhazRG+9VO23W+tugrqfpyUFqtNRFeL8LOPqKwHGqtI9zYnl1M5NjNROnuGLF2
         2ctLWtYfblKuKQa/RuXzlRFrZ4SjE4rACqZxlhAZ7ojiIQObnt/QO6lrRdCxoOmLfYwK
         ypRic/ERhlztI/qiY96BWLPtN7f9IupjRV33C0Eua6mLxjcD/EkwYUO37+IK+0TymRJo
         oilA==
X-Gm-Message-State: ABy/qLboRTP68Ei6WWO57DKhyAPqCWYud3J/Rga4hPG00eajLQ2lRD+k
	k/bQ40D0EgFdPR5s7t3+l/hvDottQgLekmhB8fFtKqJAziS9tpN6bENn1tEYCvxtYGtlcwyYkqD
	f0w6iM8mqI5fdw8yHfLVLG/ahSRrM9fbbPg==
X-Received: by 2002:adf:e489:0:b0:317:5dca:895 with SMTP id i9-20020adfe489000000b003175dca0895mr4012252wrm.71.1690975560623;
        Wed, 02 Aug 2023 04:26:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGWcjuYQWI6cWwz1X4/rqDno7JcZof8VLRDnrDpudU3CV5NYevaXCgW04hPTws81X+YagILvw==
X-Received: by 2002:adf:e489:0:b0:317:5dca:895 with SMTP id i9-20020adfe489000000b003175dca0895mr4012238wrm.71.1690975560266;
        Wed, 02 Aug 2023 04:26:00 -0700 (PDT)
Date: Wed, 2 Aug 2023 07:25:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
Message-ID: <20230802071603-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsDo8dKSwD=Uovo=ekussqQmA8kf90jzuRoDBZs2B-GTw@mail.gmail.com>
 <PH0PR12MB548134EA03AE48ACD6F422CADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvHjAkbQ1D_PNhObpZ00g3P=E7Bzj3RvBPpst6cCFTWcQ@mail.gmail.com>
 <PH0PR12MB5481ABF25620784987149809DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481ABF25620784987149809DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio] RE: [virtio-comment] proposal: use admin command (and
 aq) of the device to query config space

On Wed, Aug 02, 2023 at 09:57:47AM +0000, Parav Pandit wrote:
> > If you care about admin
> > virtqueue then device configuration space is not the only thing that can be
> > "ever growing", common_cfg is another one. 
> The idea is to do minimal bootstrap work from the common config space and switch to the queue.
> So common config shouldn’t be growing either other than minimal bootstrap functionality.
> Hence, common config also to be available via dma command.

That is more like a new transport. I thought this proposal is focusing
on device specific config - let's get a handle on that first?
"common config" is a pci transport specific thing.


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

