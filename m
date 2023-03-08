Return-Path: <virtio-comment-return-4798-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEF0C678D5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 14:31:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 563553356A
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 14:31:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E6BF986706
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 14:31:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4606C9866EE; Wed,  8 Mar 2023 14:31:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 344559866F4
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Mar 2023 14:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ah4fgvajNDaby3wfZUUxxw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678285900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yq5cTmQIV4ktnZFtl96YB8FLcc/u0X3cdT8qXshCC1Q=;
        b=MWOGSzk2jBbAeT/cBhKENHwKlQGob0fA/hmM0VaVuFvackvTHj/SmdkEiYjPvRTzLa
         /agsslmMnpZ+7Y3aP6R4dv9T82v+rsqgMvX6bEORABicaVM48MDmPMeag2R/nwfwuytD
         moGH5RpGMC0x2aGeZkSdCx4VgBVlIEgOIVK7bcB0Hk9zriFQqzDp6NOy5QcdpjQiWB8+
         4tkZgb5d563YKc2WXIyx9MNo3bePb7frY9JHtPWxzrC3SBLxKPFjSvOFRRf8FPp2mUHy
         mPBVc0SWb2Qxbvnp8DVCk7sThfHxTdJsIrSjwIq42D10qps4HeDz5fenxql22mbyUEtP
         ZP7Q==
X-Gm-Message-State: AO0yUKVLWSF4dJ1cn11oY4iUf3eE1G4m8ysXERioC28Ap4mtoZptcQCF
	wPAU5RpqDCagCT48JOArdhtGB7QFGLmmyYHamaYAsM7d8bLyiWyndW4G4ySJO68oq+j8CBlnHSu
	QlkiJcuP51hBTsYjv2Hfrp5YTtUnc1BxYfg==
X-Received: by 2002:a17:907:6e1f:b0:8af:2a97:91d4 with SMTP id sd31-20020a1709076e1f00b008af2a9791d4mr21676320ejc.14.1678285900253;
        Wed, 08 Mar 2023 06:31:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/76yHL52ITMsZnRmnJsDaIKrixFFYL9PCtlO28RLVlBpnseqABBnbZDySk37P1NtICQyyKBw==
X-Received: by 2002:a17:907:6e1f:b0:8af:2a97:91d4 with SMTP id sd31-20020a1709076e1f00b008af2a9791d4mr21676301ejc.14.1678285899998;
        Wed, 08 Mar 2023 06:31:39 -0800 (PST)
Date: Wed, 8 Mar 2023 09:31:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
	Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230308093057-mutt-send-email-mst@kernel.org>
References: <20230306154817.14115-1-hengqi@linux.alibaba.com>
 <615fdf98-c170-2855-7712-ec210ad649ad@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <615fdf98-c170-2855-7712-ec210ad649ad@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v10] virtio-net: support inner header hash

On Wed, Mar 08, 2023 at 10:27:13PM +0800, Heng Qi wrote:
> Do you have any comments, please?
> 
> Thanks. :)
> 
> 在 2023/3/6 下午11:48, Heng Qi 写道:

It's been just 2 partial days. Sit tight pls.

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

