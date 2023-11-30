Return-Path: <virtio-comment-return-8686-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90634C4167B
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 04:13:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C0EB82A8EA
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 04:13:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9FB6D98666D
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 04:13:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7E4A298666A; Thu, 30 Nov 2023 04:13:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 699C1986669
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Nov 2023 04:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701317594; x=1701922394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWtZgA3nu53R7A42unkUv/I07a8KBKJ4js7mw+kZz2Q=;
        b=XuGFkOwfvZOezSTu2m9/MBZKlk8T3pRTSayCQIY/QYGeoZmiyof/K5eWZOWl8+S0G9
         0Ot3esy7Vqwh8J9HyLitt+ofe6I9qQwoEZXQXNQJoatfuzIRxsQbtXOzeAx0dCXAoq9+
         ggQPhkr+yNbA2o6fUGpgwRmfJ6j+BXpY1EWVrGsyuiFjaaRghW5XLaUghEVEq2ilN52Z
         79cXqH16O3RQhEN+uCc3aR0lCNRg/fWca02zxmncgztI5WUwVTcPxkf+lk64sRZ3F3/K
         LLZSnXaF2n4Xq4b7NvOBxzvGlfHR9Xjy1nkHan6V4ynTi1Qa6BWLqE6zFStNgKDqhe5I
         +5lg==
X-Gm-Message-State: AOJu0Yzy5/d9wHtz2NMBgOhwM86K6TVzqLRNc4Q70tST7EaUvKsvgeFk
	y5rhrVQsK+XbHdQm6Iky/KPqvQ==
X-Google-Smtp-Source: AGHT+IGrBsyglmFw93JCly//zw3xWrM49pjQS47QAwpf94OUnoDX57t86yeJWk73bp/OtiFRbvktrA==
X-Received: by 2002:a05:6a20:160b:b0:18c:3ec:5ad5 with SMTP id l11-20020a056a20160b00b0018c03ec5ad5mr23146619pzj.57.1701317593839;
        Wed, 29 Nov 2023 20:13:13 -0800 (PST)
Date: Thu, 30 Nov 2023 09:43:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Haixu Cui <quic_haixcui@quicinc.com>, virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.oasis-open.org, harald.mommer@opensynergy.com,
	broonie@kernel.org, qiang4.zhang@linux.intel.com,
	quic_ztu@quicinc.com, alex.bennee@linaro.org,
	vincent.guittot@linaro.org
Message-ID: <20231130041311.3azypbxfoujkwhj7@vireshk-i7>
References: <20231127101750.6xmthho6lnppyw3k@vireshk-i7>
 <2ca987a6-eeb2-4ed6-9a12-10ae450eb4bf@quicinc.com>
 <20231129073022.ohxsfuawambvh3hm@vireshk-i7>
 <0674be8e-221f-479a-8da2-8a3e59e45bb9@quicinc.com>
 <871qc9x8k2.fsf@redhat.com>
 <9e0c5e5e-db7b-4634-9423-f4db1800b148@quicinc.com>
 <20231129100002.q73wtz6mkfixcbzt@vireshk-i7>
 <5367c2e6-93f1-4a4d-867e-0074b452052a@quicinc.com>
 <20231129113417.7kb6my3mm67zal3q@vireshk-i7>
 <87y1egwx27.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1egwx27.fsf@redhat.com>
Subject: Re: [virtio-comment] [PATCH] [PATCH v5] virtio-spi: add the device
 specification

On 29-11-23, 13:42, Cornelia Huck wrote:
> On Wed, Nov 29 2023, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > On 29-11-23, 18:31, Haixu Cui wrote:
> >> Hi Viresh,
> >> 
> >>     Thank you for your helpful comments. In next patch, I will clearly point
> >> this out:
> >
> > Great, finally we are on the same page. Thanks Haixu.
> >
> >>     "For full-duplex read and write transfer, both \field{tx_buf} and
> >> \field{rx_buf} are used and the buffer size of \field{tx_buf} must be same
> >> as \field{rx_buf}."
> >
> > Suggest rewriting as:
> >
> > In full-duplex transfer mode, both \field{tx_buf} and \field{rx_buf} are sent by
> > the driver, \field{tx_buf} followed by \field{rx_buf}. The length of both the
> > buffers MUST be same.
> 
> Is that in a non-normative section? (Sorry, I've lost track here...)

I think yes, though I am not sure where Haixu will put it eventually :)

> If
> so, I would say:
> 
> "The length of both buffers has to be the same."

That's better. Thanks.

> > device MUST fail the transfer and notify the driver.
> 
> "notify the driver" == "set an appropriate error value"?
> 
> Can this be covered by one of the existing error values?

I think yes, this can be handled by the Param error.

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

