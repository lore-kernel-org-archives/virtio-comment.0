Return-Path: <virtio-comment-return-5741-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E07DC77B7F
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 01:52:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 15D15C6109
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 01:52:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 08FAB9866AE
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 01:52:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EEEA69862A9; Thu,  4 May 2023 01:52:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D738198663F
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 01:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683165170; x=1685757170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJlLvpxIEwM2LxbhU8dvX+QBUibqsL1PMxR7bY8ZtnA=;
        b=OmvbihYcTbHABF+0GfmcoCYZnxWyXH1NI0JAYpjcIDaPIrE6n0M+px8v5PpSvyTIyT
         p09ntST5MayOsmPgWGfhEf82xml4MtL7WWucYREOkL5fojJiVa0QUKvoXtOd8ger+GqW
         AlyOVEy1C/F5RP2xBruXTbiM6ufZJjaRKhGbROpSdcdFJjmL6FvNWC3aLpjIMuR0dwpS
         aB+1tTuv2+KT0PpTjigKbY7eIbMGLuIz9QZgrbV2VtWOaq1bVrYLZLIiNq4KMgbn3tlz
         s8b2Ghy+YKmfkZq49AKKZou1a2rI9iqMZXG18abMozTBBrRsvWBxTkL2rQ1T9gEOP1tW
         HOAQ==
X-Gm-Message-State: AC+VfDxxY1Q32iHVSS9GwnpAi+Wedi69+NXze+RbuedGnoU4Zj+Nis5x
	kZA0ffgmnItLrOcz+8ENNOSkpw==
X-Google-Smtp-Source: ACHHUZ4MKzTnAB6GirmEXkMPOLmIe2pri4NspmPoVJQBTMMUOLtRn0rZbsfMe/sUkofjcxB+h9ws8g==
X-Received: by 2002:a05:6a20:8406:b0:f8:a481:a951 with SMTP id c6-20020a056a20840600b000f8a481a951mr800288pzd.2.1683165169914;
        Wed, 03 May 2023 18:52:49 -0700 (PDT)
Message-ID: <a87140aa-69c1-387a-cc86-bacaf613d706@bytedance.com>
Date: Thu, 4 May 2023 09:50:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>
Cc: "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "houp@yusur.tech" <houp@yusur.tech>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>
References: <20230503125807.475394-1-pizhenwei@bytedance.com>
 <PH0PR12MB54812E7B5BDDA7748EBE8BDDDC6C9@PH0PR12MB5481.namprd12.prod.outlook.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <PH0PR12MB54812E7B5BDDA7748EBE8BDDDC6C9@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: RE: [PATCH] transport-fabrics: introduce Virtio Over Fabrics



On 5/4/23 04:54, Parav Pandit wrote:
> 
> 
>> From: zhenwei pi <pizhenwei@bytedance.com>
>> Sent: Wednesday, May 3, 2023 8:58 AM
>>
>> In the past years, virtio supports lots of device specifications by
>> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
>>
>> Introduce Virtio Over Fabrics transport to support "network defined peripheral
>> devices". With this transport, Many Virtio based devices transparently work
>> over fabrics. Note that the balloon device may not make sense. Shared memory
>> regions won't work.
>>
> 
> Before getting in the details of the 1000+ lines of text, lets please have some basic protocol set as it is unlikely going to conclude with one patch.
> 
> 1. Please version your patches as "PATCH v0" -> PATCH v1" etc.
> 2. add change log of major items changed/removed/added, so reviewer can focus on those at priority while ignoring existing things from vN to vN+1.
> 
> 3. Split giant 1000+ lines of text to smaller incremental patches.
> 
> An example for this would be,
> a. overview of fabrics
> b. Theory of operation
> c. descriptor structures
> d. device/transport Notifications
> e. Queue connect/disconnect commands
> f. control path commands (get/set features etc)
> g. data transfer commands and responses
> h. conformance sections

OK, I'll send a v2 version later.
Thanks!

-- 
zhenwei pi

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

