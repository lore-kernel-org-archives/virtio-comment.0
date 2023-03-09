Return-Path: <virtio-comment-return-4830-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DA2C64EC4
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 06:39:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E442D370EF
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 06:39:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D52B79866FC
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 06:39:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CCE1F9866F3; Thu,  9 Mar 2023 06:39:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AED4F9866C1
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Mar 2023 06:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: sNjeOh-HMsCYomfFTW3B5g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678343937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM8I01iJln2Lm9mz9kd+tnaEVWi+PPW3+SPORq5zNS8=;
        b=X313dAyKWeVXqnB9kTMYLq1v0H01VF/YSurislRQsRz6e7PEyOAKkdz8NJXdp3tOuR
         ogQMDVXq7tTEQcG1agZOW/TWsxrs2FdUv2xG4Ih62yZmaHY9H0h1YrhwWw05vOnUJdCp
         0QI7biUWtn+vF0WxmTSPuCDqDAyk+J+e4QBjWEsqH1DV7YNZ6aSgsPHWuvZiAKPT0XYx
         dLEccCgVdzPg2VKUTLeXqTNm7reJgoizCzveFRTtR9OuOpaxqGCuuk5WLnuP3Crft+cC
         vHY9IyO/0AxU7KK7cUi1n4xmY1BmHGUy4ZxPbCU2JQC6wVPux4zYZqXAqYDcH/B/dub4
         0WPw==
X-Gm-Message-State: AO0yUKUaJux0955flK1tufVDTUP3R9JXjlFYwVyfwGj8Azlw4OPoBJBZ
	8qtC0MNcVF4/u1I5w23x92imJHuwu1t+5B/MKHWcrmcW5OKcAbb/1zVCHmZKuwGlf//X08YzOwa
	S7pTDyMyxUN0hfuYs+RYgmPup4ocFmi4FNQ==
X-Received: by 2002:a17:906:304a:b0:8f1:937c:f450 with SMTP id d10-20020a170906304a00b008f1937cf450mr18625879ejd.13.1678343937430;
        Wed, 08 Mar 2023 22:38:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/dIrQjEeccEcGHszSjNaVjXimi9oBjrN2zoGN0sZT1aFZkWiAsLkGjtJQAXOIPA94E8l0qGw==
X-Received: by 2002:a17:906:304a:b0:8f1:937c:f450 with SMTP id d10-20020a170906304a00b008f1937cf450mr18625863ejd.13.1678343937101;
        Wed, 08 Mar 2023 22:38:57 -0800 (PST)
Date: Thu, 9 Mar 2023 01:38:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"nrupal.jani@intel.com" <nrupal.jani@intel.com>,
	"Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
	"hang.yuan@intel.com" <hang.yuan@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230309013747-mutt-send-email-mst@kernel.org>
References: <910b3607a5f255134d30b3e1233e564f564eafb8.1677761896.git.mst@redhat.com>
 <PH0PR12MB548116853CAC23DF9CA7345EDCB29@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230302201912.GC2554028@fedora>
 <20230302185803-mutt-send-email-mst@kernel.org>
 <20230303131703.GB2866370@fedora>
 <20230303081900-mutt-send-email-mst@kernel.org>
 <4f869944-4ccd-c51e-0f30-dc3ba15ffd52@nvidia.com>
 <20230307192752-mutt-send-email-mst@kernel.org>
 <6668fd7a-3eb3-0447-9cbf-72d308b1336a@nvidia.com>
 <2ef47f53-5978-4b6a-593d-4e94eba0b9ac@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <2ef47f53-5978-4b6a-593d-4e94eba0b9ac@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v10 03/10] admin: introduce group
 administration commands

On Thu, Mar 09, 2023 at 02:29:31AM +0200, Max Gurtovoy wrote:
> please use "Co-developed-by:" for this patch

Sure.

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

