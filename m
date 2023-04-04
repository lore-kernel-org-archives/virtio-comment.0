Return-Path: <virtio-comment-return-5203-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD4CC6FD1D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:14:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DF2BF42A69
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:14:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BCCAC98640E
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:14:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A0FA29863E4; Tue,  4 Apr 2023 07:14:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8EF239863E6
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 07:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: _O_mNiCUPzWDOV8GalpEow-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680592437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYfdpUktbIgUdhvdEPnLE35dGDYkSRqGeOuXsFLfvrM=;
        b=0wXqTvQ68a42sP8oUFLmNxm1+VfSmRnTNoqbma9pwuDxAs+4e6WYOItDUZgsUrE6Gz
         JAIEtAX4wWOr6rdOFmr8k2azaCRvtuUHrsCUaj2cJ0ZgyeNohjTUhc5YT6vj3qjgZC8O
         V0ajLIbK3s4ayPPlP/30Ah80SokhuJxsf360mMPjURSyMxjUPU8HwlgFaFHxdL3tr4/k
         yqZa+jgbfyNQw1Ih01/NIwCnnxQlr2tkye0OAm5YI1MEFXjh7G+4wkJclLZFVosfCfIi
         iHCmpKYiFDk8V4Z9fbjAgTR9KOLARpFDGtIgIAln2QiFmMolaYZedDyjDaiOVzAVDc7Z
         BmRQ==
X-Gm-Message-State: AAQBX9fYI7X2vPey76hhtxyJV/+WfWtwNw8Ny9O+5s0NzjZPE4U3dqy/
	D5XPKZh1aiJe/XnkfyTDlBEnbYYHwNieVARrgtxvTZ2VpNLLjukIqewmgFJgDlIWrulJJl+4JQF
	qZvwkaPADxQst4dvv4XJG3JRpmldOFTYyeA==
X-Received: by 2002:a17:907:b9ca:b0:933:4556:d1cd with SMTP id xa10-20020a170907b9ca00b009334556d1cdmr1552129ejc.33.1680592437720;
        Tue, 04 Apr 2023 00:13:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y4WBBiI5RXqWOlX740OJdMHzwObGfT0D0ci20CM6bOjq5T45eli4YqOdUTX8Jn6DIEZcPzsQ==
X-Received: by 2002:a17:907:b9ca:b0:933:4556:d1cd with SMTP id xa10-20020a170907b9ca00b009334556d1cdmr1552118ejc.33.1680592437482;
        Tue, 04 Apr 2023 00:13:57 -0700 (PDT)
Date: Tue, 4 Apr 2023 03:13:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Halil Pasic <pasic@linux.ibm.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230404030859-mutt-send-email-mst@kernel.org>
References: <20230329212341.465843-1-parav@nvidia.com>
 <20230330191114.77acd860.pasic@linux.ibm.com>
 <PH0PR12MB548165C4B11375F8C7EE7AD1DC8E9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230404033622.4b749f89.pasic@linux.ibm.com>
 <d62d2090-de0d-0ea6-5c85-ecf19ae828c7@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <d62d2090-de0d-0ea6-5c85-ecf19ae828c7@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v10 0/8] Rename queue index to queue number

On Mon, Apr 03, 2023 at 10:57:35PM -0400, Parav Pandit wrote:
> I see few options.
> 
> Option_1:
> 1. I will send v12 of this series to use index all the places instead of
> number.
> 2. driver notification structure vqn to rename to vq_notify_id.
> (after merging this series as follow up cleanup).

We can pretend that vqn means "VQ Notification".  Backronims are fun.
In fact it is not always a vq index, sometimes it's a different value.
So maybe keeping vqn there makes sense.


> 3. Once interrupt moderation series is merged, rename vqn to vq_index.
> (really vqn reads better even though history say vq index).
> Because votes is completed and voting period ended for the important
> feature.

It's ongoing but sure, we can do a fix up on top.

> 4. Michael send v12 with index.

Of AQ? Sure.

> Option_2:
> 1. Continue with the v11 of this series as vq number.
> 2. Continue with interrupt moderation series voted
> 3. Continue with Michael's work of AQ
> 4. Will do #2 of option_1.
> 
> Please decide at earliest.
>

It looks like the sentiment is now going more option 1.
If you like post v12 and we'll see which gets more acks.

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

