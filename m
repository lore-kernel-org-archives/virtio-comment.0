Return-Path: <virtio-comment-return-6069-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E447C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 16:14:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5790E120D48
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 16:14:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51E8098661D
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 16:14:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 492CF986613; Thu,  1 Jun 2023 16:14:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 381F8986614
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Jun 2023 16:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: mBKgh__FMvSDGpdVXSuDrA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685636055; x=1688228055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92RucYc/5MwN8QJ1CGIplO9RtCgXy3vFz5w1L7ba/TE=;
        b=cAc4XarSuk4BIBzGjn6tBRp/FFkDxqwmJMa3P/JKUPo2bLQ/wU4z/yLYO+7HdbA56x
         n3K2NPshsXskNU/h0Yl42YQnHUxhq9iEpx+l4XmPE9gFBRVZoN3qOeftOlXP8YXaLM6C
         CEseSCTkZtAl33tAN7CC2Wm6db8NiwyCTlrTnXxMdnGONiGCXP1QF3yd8aE1OSTapj6m
         /3sMKzwKNpffXcTHPX+5jXuiyNxrD/TUfM82WbcwsRXVa4u2Shand2/mPn8vS3oZpkeP
         FH9qm89g0o8J1+ieou+cNXwMwpoce55OBn6tysume6/XzqDTELYsWNLHv6qfoc9D8dq3
         lrBw==
X-Gm-Message-State: AC+VfDwUu+SgRoxRME8mWCIpqmFBm4+c20Ktga8MwBcCk8CZ1wznsnBF
	bpxlOOtdmtDS7lFt2d1TtYxORaJNm6IbbKhhQKlY1YCbisfWE8FhvuxEm62wNH1gZooZFGdFYPe
	QOr3BFnX7mBDPHxWpYwx2+K1aDgYm+hws/w==
X-Received: by 2002:a1c:f70b:0:b0:3f6:76e:6049 with SMTP id v11-20020a1cf70b000000b003f6076e6049mr2457887wmh.1.1685636055280;
        Thu, 01 Jun 2023 09:14:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7bYiZyYwaoc6T/wcfYmL0WkfBwvrnjDHxrtl7D7Ol+WB+v4dxBosXawm3BNlAReVbpZcan/A==
X-Received: by 2002:a1c:f70b:0:b0:3f6:76e:6049 with SMTP id v11-20020a1cf70b000000b003f6076e6049mr2457872wmh.1.1685636054895;
        Thu, 01 Jun 2023 09:14:14 -0700 (PDT)
Date: Thu, 1 Jun 2023 12:14:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230601121137-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] virtio networking collaboration meeting: call
 for agenda

On Thu, May 18, 2023 at 12:53:56AM +0000, Parav Pandit wrote:
> For the first meeting, I propose the following agenda item:
> - discuss new virtio net device features for 1.4 spec release

Want to include a bit more detail here?  What do you want to discuss? At
the moment the only thing I see on list is inner hash proposal.

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

