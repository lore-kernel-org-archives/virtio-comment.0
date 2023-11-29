Return-Path: <virtio-comment-return-8681-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D22C4167B
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 11:35:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7390C190937
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 11:35:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1114F9868C3
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 11:35:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 377329865ED; Wed, 29 Nov 2023 11:35:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 077B798663F
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Nov 2023 11:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257660; x=1701862460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzSW52z0J1r9u58ZV+HTu+fjNvnbZstrohfCQ1pjh9I=;
        b=pTN4nybGicCX5EZJBkBFqdoIzRa5CH4ioRjpR4z3C59yNAMBNtQp5ryhAXm809yDb7
         7Ljzo62c4tQXR059g1tdGMy/cP/VEMXwr8sr6InIM2/3IZpih9JUvfJcxhnytoeCmgHc
         ajaQallN/8EcdM8qP0hPmAg+w/XWMEzhW1DisOi2bMqwNSUFicIq4BKVCsb/RRJiPuhS
         k41F9cSos29ahrk73QI07/3qwfkwm0xUHmjOL54FxUcHslZ5KpSTZ3gJrFyJEuHYhA+3
         1mZe/ZKmuvKIWAGv4Bb9V1GWUl6DZUSOOlnzEICPAytMH6M+O4Xf6lsxYs5cciqBIe+h
         W2zw==
X-Gm-Message-State: AOJu0YwD/a1b1QoLNGj+rqFhB2FNcQ+E5+Cgmzy58kUnPE1JK6UO1QfX
	3cfbHZ1YwH4b/RXQ75RItA5Ctg==
X-Google-Smtp-Source: AGHT+IEUPJyukT43/15wzH47UF7krxvq0TQ6ZhEfCckrhX3iJYtO5lN7Z1IUbi08ArGwyJSuymJy6Q==
X-Received: by 2002:a17:903:234c:b0:1cf:cb27:3aa5 with SMTP id c12-20020a170903234c00b001cfcb273aa5mr13203610plh.5.1701257660499;
        Wed, 29 Nov 2023 03:34:20 -0800 (PST)
Date: Wed, 29 Nov 2023 17:04:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haixu Cui <quic_haixcui@quicinc.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.oasis-open.org, harald.mommer@opensynergy.com,
	broonie@kernel.org, qiang4.zhang@linux.intel.com,
	quic_ztu@quicinc.com, alex.bennee@linaro.org,
	vincent.guittot@linaro.org
Message-ID: <20231129113417.7kb6my3mm67zal3q@vireshk-i7>
References: <20231124072015.12655-1-quic_haixcui@quicinc.com>
 <20231127101750.6xmthho6lnppyw3k@vireshk-i7>
 <2ca987a6-eeb2-4ed6-9a12-10ae450eb4bf@quicinc.com>
 <20231129073022.ohxsfuawambvh3hm@vireshk-i7>
 <0674be8e-221f-479a-8da2-8a3e59e45bb9@quicinc.com>
 <871qc9x8k2.fsf@redhat.com>
 <9e0c5e5e-db7b-4634-9423-f4db1800b148@quicinc.com>
 <20231129100002.q73wtz6mkfixcbzt@vireshk-i7>
 <5367c2e6-93f1-4a4d-867e-0074b452052a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5367c2e6-93f1-4a4d-867e-0074b452052a@quicinc.com>
Subject: Re: [virtio-comment] [PATCH] [PATCH v5] virtio-spi: add the device
 specification

On 29-11-23, 18:31, Haixu Cui wrote:
> Hi Viresh,
> 
>     Thank you for your helpful comments. In next patch, I will clearly point
> this out:

Great, finally we are on the same page. Thanks Haixu.

>     "For full-duplex read and write transfer, both \field{tx_buf} and
> \field{rx_buf} are used and the buffer size of \field{tx_buf} must be same
> as \field{rx_buf}."

Suggest rewriting as:

In full-duplex transfer mode, both \field{tx_buf} and \field{rx_buf} are sent by
the driver, \field{tx_buf} followed by \field{rx_buf}. The length of both the
buffers MUST be same.

>     And in drivernormative section, I will add a requirement:
>     "For full-duplex transfer, Virtio SPI driver MUST guarantee the write
> transfer size is equal to the read transfer size"

Maybe:

drivernormative:

In full-duplex transfer mode, the Virtio SPI driver MUST guarantee that the
length of both \field{tx_buf} and \field{rx_buf} are same.

devicenormative:

In full-duplex transfer mode, the Virtio SPI device MUST verify that the length
of both \field{tx_buf} and \field{rx_buf} are same. In case of any mismatch, the
device MUST fail the transfer and notify the driver.

>     In fact, in my prototype, I only perform the transfers with same tx/rx
> length.

Great.

Thanks.

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

