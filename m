Return-Path: <virtio-comment-return-8705-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5787FC4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 05:44:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A6FAD2AECE
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 05:44:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D6E49868BA
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 05:44:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6816898669A; Fri,  1 Dec 2023 05:44:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 576B798669D
	for <virtio-comment@lists.oasis-open.org>; Fri,  1 Dec 2023 05:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701409446; x=1702014246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRYwALF9WS2lUzi44MPib+ioLc/DdbV1vmaRK9fsULI=;
        b=o+s1IexCAUnXxYZB2xtO0dAdDCjWcn4JEawg+j8TrK4Tuvfpv3nVVMUc1xOIoAG536
         4Du/WfriysJ02qh04WbtOA1Nu6Z6lo7Je5zDFPiPciNLMiI7v2oxFGSdvrDdi+WqLMSm
         5nOSWU8PgeF7GdOuENjmUUvi1p5alT8q+3zUh0btz0afx0wEi3DjJnXF2rxPP901KhHU
         HN9enVa1LySYmyY2GQeLg7hB9NxKqXsOPGD40Wyca4P+rG8J/698ptYvSwBkdjTJdi7E
         C7VVPJAoNS2WGHQp1hg6eEGtvSPmHsXDlcgncSaFJ+Ae9b+8ji4RPQOb+vPEPmN0pTVt
         6tbw==
X-Gm-Message-State: AOJu0YxEsNBs/Ew0CvVZi+5J9bymDPiRF5mrdUIAtsQJtnZSGGbGJ/7B
	m9ZQiIaZA1cuq7/fzDxPyh/FPA==
X-Google-Smtp-Source: AGHT+IEZYQvcg3GaGsUs+qmLMAVXzEuT66aUk5/8tGelt61bKarfdHokgPWXVW8eiq0qajnfX9wipA==
X-Received: by 2002:a17:902:bf09:b0:1cf:fca9:80b3 with SMTP id bi9-20020a170902bf0900b001cffca980b3mr9487110plb.33.1701409445794;
        Thu, 30 Nov 2023 21:44:05 -0800 (PST)
Date: Fri, 1 Dec 2023 11:14:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haixu Cui <quic_haixcui@quicinc.com>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
	cohuck@redhat.com, harald.mommer@opensynergy.com,
	broonie@kernel.org, qiang4.zhang@linux.intel.com,
	quic_ztu@quicinc.com
Message-ID: <20231201054403.kpykp6g7kggxsgyo@vireshk-i7>
References: <20231130092242.17303-1-quic_haixcui@quicinc.com>
 <20231130092242.17303-3-quic_haixcui@quicinc.com>
 <20231130111900.ix3cfsxlns2blp4r@vireshk-i7>
 <b26382c1-6601-44b8-8376-3f96d605f2d5@quicinc.com>
 <20231201043203.7ozpnk2k3dci4pq4@vireshk-i7>
 <bd50a1e1-75ab-41c3-9fdd-9cfbeb13034e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd50a1e1-75ab-41c3-9fdd-9cfbeb13034e@quicinc.com>
Subject: [virtio-comment] Re: [virtio-dev] [PATCH V6 2/2] virtio-spi: add the device
 specification

On 01-12-23, 13:35, Haixu Cui wrote:
> Hi Viresh,
> 
>     SPI transfer modes here may cause misunderstanding, in Wikipedia, SPI
> mode is the combinations of clock polarity and clock phases:
> 
> 
> https://en.wikipedia.org/w/index.php?title=Serial_Peripheral_Interface&action=edit&section=4

The word 'mode' is indeed confusing. It is used for combinations of PHA/POL,
half/full duplex, n-bit transfers, etc..

>     What about updating as: "Note: The commonly used SPI n-bit transfer
> options are:"

That's fine too.

-- 
viresh

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

