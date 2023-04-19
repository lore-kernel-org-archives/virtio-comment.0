Return-Path: <virtio-comment-return-5537-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEDAC77B73
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:05:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F393E2AC4B
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:05:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D9192986421
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:05:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C155C986416; Wed, 19 Apr 2023 07:05:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 88D3798641B
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Apr 2023 07:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: k9sjHmYqMJK_rfrSRuHWcQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681887911; x=1684479911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DW5vl8wAqG6chq9AcTW6cOrJSOh0tRKwP9bQroOCzXo=;
        b=dyzu+Yus7XncBSi47hnlnD3JNlOAl9BuoNNoCZ/xPkU0GwTQff4hLIwK82I8osaEwC
         1B61zwEvkq3oQEU5f6eppfGLJUNbi863zIuMwLKl3pCNABG/pOI5wshOD3tvMJKV2DyE
         b6tuwxuk22WNkdGkwvvp7Txnopnlg9WXMQICmiHvUKQanyMWSFt3nxkWZhnD2g17lwHe
         X3Zn2WrNhPAt/kISEUUiJVUn4UTHzRh8zWKkuYsA4WO9pT6mdxLoLL5YS1tn/+g+9Ojc
         1Nbkge6EGeKXdYGnIt/lB0fQJICSXcmeLS7zxq7uvBZORXDu7f83bv6jIcGBA/WVcT//
         pOZg==
X-Gm-Message-State: AAQBX9eiKV5YaiTq7M3Z1sqtK/OtBchgnMX7fQt0dJdo4BGun+yDt5X1
	4nb6vmUcbeJGFRjCgJ4+wCOw93loignDuQCQwck5VschpqF4Xa+QrTnJWAR3ac4IvspMSLUaiKA
	eTY8fMCQAYDINoctlijjOTQtTJMRYXeuqGw==
X-Received: by 2002:a7b:c394:0:b0:3f1:6fb3:ffcc with SMTP id s20-20020a7bc394000000b003f16fb3ffccmr9728403wmj.22.1681887911097;
        Wed, 19 Apr 2023 00:05:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350YI+rA7A5YbRp6AsiE/X6rTwymmwdF4XoUuNSdduhhEC65ymRH4uEQg+bMGJLE6omFDEdLnQA==
X-Received: by 2002:a7b:c394:0:b0:3f1:6fb3:ffcc with SMTP id s20-20020a7bc394000000b003f16fb3ffccmr9728385wmj.22.1681887910840;
        Wed, 19 Apr 2023 00:05:10 -0700 (PDT)
Date: Wed, 19 Apr 2023 03:05:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230419030057-mutt-send-email-mst@kernel.org>
References: <20230411194220.752355-1-parav@nvidia.com>
 <20230411194220.752355-2-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230411194220.752355-2-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 1/2] transport-pci: Improve config msix vector description

On Tue, Apr 11, 2023 at 10:42:19PM +0300, Parav Pandit wrote:
> config_msix_vector is the register that holds the MSI-X vector number
> for receiving configuration change related interrupts.
> 
> It is not "for MSI-X".
> 
> Hence, replace the confusing text with appropriate one.
> 
> Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> 
> ---
> changelog:
> v0->v1:
> - added 'here'
> - dropped 'receiving'
> ---
>  transport-pci.tex | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index 42be072..cb9fadd 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -343,7 +343,8 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          Driver Feature Bits selected by \field{driver_feature_select}.
>  
>  \item[\field{config_msix_vector}]
> -        The driver sets the Configuration Vector for MSI-X.
> +        The driver writes an MSI-X vector number here for Configuration change
> +        interrupts.

Hmm I think it's "the vector", not an. And the order of words
is unusual. We also don't normally use "writes here". Would

	Used by the driver to set the MSI-X vector number for Configuration change interrupts.

be equally acceptable?


>  \item[\field{num_queues}]
>          The device specifies the maximum number of virtqueues supported here.
> -- 
> 2.26.2


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

