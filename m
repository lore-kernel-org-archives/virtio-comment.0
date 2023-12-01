Return-Path: <virtio-comment-return-8715-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE05C4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 08:38:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7C7AC42A83
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 08:37:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58566986888
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 08:37:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 45CC098669A; Fri,  1 Dec 2023 08:37:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3675A98614B
	for <virtio-comment@lists.oasis-open.org>; Fri,  1 Dec 2023 08:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701419876; x=1702024676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8Fe5hcLPJKwZ8SsBsVjftNI1/vPOKic66ZaxXHl3hY=;
        b=SE0xra5O79dnJfdHsV04eANqNUe9cssA+uGDdWdCdN0vfv7W7Ic+e3HyJwYCG0VRDb
         +lkhCX/2pgzSmR7MlcH14p7fSmgpTjCO+CJSjXvUTolB5WKtjjrA32rjZ0kQOyAF81xb
         f5JG73zZCnx3wlWWOaY33VOIz57mpMJnlwU6PAfdiEIEp3V16yxUZy5grSTYUIyVVkFt
         +jrloQ/Drfv3UNmsUdMM+IBSlIvdQtXeoFROcxxRP6+yzqQQOx4xg+feo58aVLEVb2gn
         RdLZi16BOnXlZ/9wh+K/zNF9lLN5IQkXyml+NEUYxxuran4gkAComgcMyFBr19Sht3Gz
         tHSQ==
X-Gm-Message-State: AOJu0YysvPSBNDZW9+lhuu8E1fcECXZa96/9HUKIetKcmYVaTjPx08Wg
	G8716QiOfm1RTrSUc07C2gFEeQ==
X-Google-Smtp-Source: AGHT+IHSebTlfn+3fMHYpsdPSz/U0NrsG4XeVsosduaqqzrxa1rAIdSn7rQVoHWFpq+QxAeo3IyesA==
X-Received: by 2002:a17:902:ea84:b0:1cf:80db:72e1 with SMTP id x4-20020a170902ea8400b001cf80db72e1mr23165816plb.10.1701419875736;
        Fri, 01 Dec 2023 00:37:55 -0800 (PST)
Date: Fri, 1 Dec 2023 14:07:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haixu Cui <quic_haixcui@quicinc.com>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
	cohuck@redhat.com, harald.mommer@opensynergy.com,
	broonie@kernel.org, qiang4.zhang@linux.intel.com,
	quic_ztu@quicinc.com
Message-ID: <20231201083753.uw7i2rwymak4etnj@vireshk-i7>
References: <20231201082143.14870-1-quic_haixcui@quicinc.com>
 <20231201082143.14870-3-quic_haixcui@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201082143.14870-3-quic_haixcui@quicinc.com>
Subject: [virtio-comment] Re: [virtio-dev][PATCH V7 2/2] virtio-spi: add the device
 specification

On 01-12-23, 16:21, Haixu Cui wrote:
> The Virtio SPI (Serial Peripheral Interface) device is a virtual
> SPI controller that allows the driver to operate and use the SPI
> controller under the control of the device.
> 
> This patch adds the specification for virtio-spi.
> 
> Signed-off-by: Haixu Cui <quic_haixcui@quicinc.com>
> ---
>  device-types/spi/description.tex        | 280 ++++++++++++++++++++++++
>  device-types/spi/device-conformance.tex |   7 +
>  device-types/spi/driver-conformance.tex |   7 +
>  3 files changed, 294 insertions(+)
>  create mode 100644 device-types/spi/description.tex
>  create mode 100644 device-types/spi/device-conformance.tex
>  create mode 100644 device-types/spi/driver-conformance.tex
> 
> diff --git a/device-types/spi/description.tex b/device-types/spi/description.tex
> new file mode 100644
> index 0000000..7c81df5
> --- /dev/null
> +++ b/device-types/spi/description.tex
> @@ -0,0 +1,280 @@
> +\section{SPI Controller Device}\label{sec:Device Types / SPI Controller Device}
> +
> +The Virtio SPI (Serial Peripheral Interface) device is a virtual SPI controller that
> +allows the driver to operate and use the SPI controller under the control of the device,

I feel the terminology here is still a bit confusing:

"the SPI controller under the control of the device"

The Virtio SPI controller is "the device" and it is not under its own control.

As I suggested earlier, maybe this should be written as:

"the SPI controller under the control of the guest"

> +either a physical SPI controller, or an emulated one.

I just skimmed through the rest this time. Thanks for your effort.

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

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

