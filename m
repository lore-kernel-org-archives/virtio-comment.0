Return-Path: <virtio-comment-return-7418-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203D8EDE9A5
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:09:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3B5262CAFB
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:09:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 94FC7986652
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:09:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 88D0098402B; Thu, 14 Sep 2023 11:09:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6FA4998681B
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Sep 2023 11:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: QEYKmlTuO3ehWrhqIQCZxw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694689746; x=1695294546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKwlPnxTwN46qRBNG5QBmwFoFAi3nHA9falJh7CT7vo=;
        b=mqCTd6Df4kB4iXgmi+RFnxoRhznb8BTQCS6ZIeqmp9YA8VHyYRJWRXxmT8w7u+ilzg
         BKie7mmPkdZ+vebkJnTc31jawrIDhj1eedn6b2Cnsvngqw4eGgfsYjbkyQsJwDWwbodz
         VDn/u3Rul2/OJrnRG6HobOgL1M5X5TkiMyvbfuy3DGzyMKEuRnGNQw+voBqZAKL8mUAB
         g78wH3WxKkwmgOSC0HxEikbkCzuHrGRIVzrtO1iNfLQELj38mLqv8laRZumyvi0gK8mB
         Jv++xVW2PG1xAhHSLai+x5UcD0xU3eLQvMX3fQ3lhrw7Ld2KGV/2gTktVnE+Talh97V8
         8Utw==
X-Gm-Message-State: AOJu0YyZD24IdH6R54Od/SOujW2oyUnd9/9V3gTd96ofH/rA1pENKW6C
	RkOYzqEhKsp5ZT/LYomYjHTpBTMgOHBIdLMlYIHmyUzuFAp51uqUTL5Gl4jA0jqTQ2SG5Y9XMTA
	PDHWS+s+n97UBXWKVqtx8YXcy0wOE426Q7w==
X-Received: by 2002:a05:6512:3f5:b0:4fb:741f:75bf with SMTP id n21-20020a05651203f500b004fb741f75bfmr3852761lfq.16.1694689746302;
        Thu, 14 Sep 2023 04:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf7SFya7g2VBoSuRNVXj7wPMKINRzbToosU76MVscHp32jqRWBu87OcelRagR13Wl2X84/sw==
X-Received: by 2002:a05:6512:3f5:b0:4fb:741f:75bf with SMTP id n21-20020a05651203f500b004fb741f75bfmr3852740lfq.16.1694689745900;
        Thu, 14 Sep 2023 04:09:05 -0700 (PDT)
Date: Thu, 14 Sep 2023 07:09:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Message-ID: <20230914070739-mutt-send-email-mst@kernel.org>
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-5-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20230906081637.32185-5-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 4/5] virtqueue: ignore resetting vqs when SUSPEND

On Wed, Sep 06, 2023 at 04:16:36PM +0800, Zhu Lingshan wrote:
> When SUSPEND is set, the device should stabilize the device
> states and virtqueue states, therefore the device should
> ignore resetting vqs when SUSPEND is set in device status.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>

And do what? If you really feel it's important we can prohibit
driver from touching state. But generally this seems
un-orthogonal.


> ---
>  content.tex | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 9d727ce..cd2b426 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -443,6 +443,9 @@ \subsubsection{Virtqueue Reset}\label{sec:Basic Facilities of a Virtio Device /
>  The device MUST reset any state of a virtqueue to the default state,
>  including the available state and the used state.
>  
> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set in \field{device status},
> +the device SHOULD ignore resetting any virtqueues.
> +
>  \drivernormative{\paragraph}{Virtqueue Reset}{Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
>  
>  After the driver tells the device to reset a queue, the driver MUST verify that
> -- 
> 2.35.3


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

