Return-Path: <virtio-comment-return-8101-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6696CC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 15:50:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BDA852ACB9
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 15:50:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 96843986BC8
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 15:50:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 86D9E986BC6; Wed,  1 Nov 2023 15:50:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DDADE986BC7
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 15:50:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698853799; x=1699458599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7OKnMnDCXmnqoo7+Ngzhgm0wCuGRbmcQWDOTRNhmbw=;
        b=BLFClKsMK1hBrb/A/03hi+V0AFJYMQoBIdF2C1GbV3lRbSTW0ychLLIQpICqQVgnez
         Qx4YIpvd2C/MQgIN2lJ2sTtmG+pdcrlJDFgBxrydifkqUuO7qImld0bSlzdQORpbTaGa
         G9rQbw0/+iU/Y7P/+nbV07zWGmvjFPEYNxd5I14Y/Lb5cDNs0OmB6a6fjqW6rAk9IUA8
         w0DwxR/RMm3jnTOPiJPF1567rFM7wPNXOX3Uuyn3VNW60DzfjMFslNezC1DVjQk2oIhs
         xmbdZQogNlezLZ8kbspmP1BUtT9LFrgdiuB/zSFuqJrm4lHCCQ0etSIuJ4VKehPaDrw3
         4Afg==
X-Gm-Message-State: AOJu0Yylb7nt09qn4y9T21u1v6nGc0uwYkAwc42+uPh7t1/OklXjp3jn
	8Qle808aZKw4/kjzE50uY/uS5Q==
X-Google-Smtp-Source: AGHT+IGaq3YZH1WRNg1a8twwHVt7Fuc6bOeF0OVye91QFV1blcnlGQY1A3isSwAyn52WLPAF2kJA5w==
X-Received: by 2002:a05:600c:1c19:b0:3fe:dcd0:2e32 with SMTP id j25-20020a05600c1c1900b003fedcd02e32mr13097481wms.19.1698853799121;
        Wed, 01 Nov 2023 08:49:59 -0700 (PDT)
Date: Wed, 1 Nov 2023 15:50:06 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Tina Zhang <tina.zhang@intel.com>
Cc: virtio-comment@lists.oasis-open.org, vivek.gautam@arm.com,
	seb@rivosinc.com, sameo@rivosinc.com, eric.auger@redhat.com,
	kevin.tian@intel.com, "Kumar, Sanjay K" <sanjay.k.kumar@intel.com>
Message-ID: <20231101155006.GB318666@myrica>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
 <20231006160947.2227396-4-jean-philippe@linaro.org>
 <b8d6172e-88c5-4f4d-8738-6ec6c90fdab4@intel.com>
 <20231018144108.GA1229555@myrica>
 <fa3263e9-6b4f-4fc7-b9e9-17f366c77ca5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa3263e9-6b4f-4fc7-b9e9-17f366c77ca5@intel.com>
Subject: [virtio-comment] Re: [PATCH v2 1/9] virtio-iommu: Add ATTACH_TABLE request

Hi Tina,

On Fri, Oct 27, 2023 at 09:38:20AM +0800, Tina Zhang wrote:
> Hi Jean,
> 
> Sorry for the late response. I was trying to build up a POC of virtio-iommu
> support vt-d page table based on your branch "virtio-iommu/pgtables",
> according to this proposal. I may still need several days. I'll publish the
> POC (e.g., send the virtio-iommu front-end change to Linux public mailing
> lists and make the QEMU change in a public repo as the implementation has
> some dependencies which are WIP in QEMU and Linux kernel communities.). Do
> you think it makes sense in terms of helping this proposal review?

Yes having an up to date prototype on a public git would definitely help
with validating this spec proposal, even if it depends on patches that aren't
yet upstream.

Thanks,
Jean

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

