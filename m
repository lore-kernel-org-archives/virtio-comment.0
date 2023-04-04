Return-Path: <virtio-comment-return-5205-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E36C7618D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:22:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A81B3370E8
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:22:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1067986400
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:22:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 96C819863E4; Tue,  4 Apr 2023 07:22:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 870D69863E6
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 07:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: C3jMw2nBOXawpx6rEUA71w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680592948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4frHWMv//C9WVZGjyCNeVLd2Cc06WBCig7LGBGwtUOY=;
        b=28lDy2n4Ibdix/mbxmItdfJkh0/X/ssmAYAWSKCPge6WmkNSLRVNvWzAp25J4Dh1z/
         zboo/2DWkEd9SsDqlg3oQCN/vSXyQy3ALXLfWmMDTleNygBTL0JRG0jXL6a9MBqbi5Zo
         lEUxNN1Pxeg1rrgkIeEOEWt0WS8NRgdcpRBpC4Ue66glKo2hMpZBjCVYbZ1jTsFc67et
         v8e52458Ke3uBtwgyExrVdNo2PvM+oX80Boct+PEFs1aJuZxq0nllx9Ep8VftcX5uwQ4
         eVhFmHlA6xDY8jz0+YB8sKeMBjN0S8hJps6C0Xa3Hb7VaIHSv+9gyhOfjhMgBYFfSw1/
         Vj0A==
X-Gm-Message-State: AAQBX9eYSdgyjeBv1eMi9Lq+N1abo+XREsiuVE59zTAbN99aFJXMUVi2
	6Hy5SrVX6TMgScY8SoBhj07mq0xx6XMhYtyJ7VWZ1qlRZRZ1DYk9ydQn5C5u6KmlZ7Ek+NzTqoe
	IbNeM6xirvRJRQcfXDTh7NNBDRU0KGS3EcA==
X-Received: by 2002:a17:906:488c:b0:939:7260:7f7e with SMTP id v12-20020a170906488c00b0093972607f7emr1301123ejq.49.1680592948683;
        Tue, 04 Apr 2023 00:22:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350atyaso9Q02b3HQpflv6PyP7819Bo0qsapPbuP230qnNYgNTt7dONJOkrnSQFFDmxaZYGGzzg==
X-Received: by 2002:a17:906:488c:b0:939:7260:7f7e with SMTP id v12-20020a170906488c00b0093972607f7emr1301110ejq.49.1680592948443;
        Tue, 04 Apr 2023 00:22:28 -0700 (PDT)
Date: Tue, 4 Apr 2023 03:22:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230404032218-mutt-send-email-mst@kernel.org>
References: <20230324013534.280820-1-parav@nvidia.com>
 <20230324013534.280820-2-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230324013534.280820-2-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 1/3] transport-pci: Remove empty line at end of file

On Fri, Mar 24, 2023 at 04:35:32AM +0300, Parav Pandit wrote:
> Remove empty line at end of file.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Applied this one.

> ---
>  transport-pci.tex | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index 044c085..6e0cb45 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -1148,4 +1148,3 @@ \subsubsection{Driver Handling Interrupts}\label{sec:Virtio Transport Options /
>          re-examine the configuration space to see what changed.
>      \end{itemize}
>  \end{itemize}
> -
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

