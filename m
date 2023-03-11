Return-Path: <virtio-comment-return-4870-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC08C61DA4
	for <virtio-comment@archiver.kernel.org>; Sat, 11 Mar 2023 21:17:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9A44041A3B
	for <virtio-comment@archiver.kernel.org>; Sat, 11 Mar 2023 21:17:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 44780986732
	for <virtio-comment@archiver.kernel.org>; Sat, 11 Mar 2023 21:17:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 35FA0986725; Sat, 11 Mar 2023 21:17:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1CE94986726
	for <virtio-comment@lists.oasis-open.org>; Sat, 11 Mar 2023 21:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: YHqwIgPuNbqaWhhIQ2c4iA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678569468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5PrtKRvlleCggJ8i/vqmaFotp+jmPmMTe0G3IpXWNA=;
        b=V3xBz0hx0ZGYerbeuhTwJizhb6dQaCjNXrJbK5TIzzARkxE5wssScuYbO7uzXsr4Ap
         ZEdBcuetk9GyeSEF4bVFm6n2OG+fN8SyA/tiDScd8j8pJOEF1DtSXi8HHw8pVLMdt6qQ
         PGUH1MtPz2e4yUypZ+1pr8su9c3zQa+RQ0oQvU6HhQSFqPeHcfWeeDZc+qhvd0cFiv15
         t496XSduaQc0bXEsDOO5fYuR9nsoUFLU4y452KrYd8uPKJ7o8mnqIp+NLS1c1SdgUPJW
         fM6BPHhFbBYnjNEwG3maZKFVNS+vrhUdqgeJNthPMlgzC9NAHO2y+sJneuR8R7dWefvC
         oGbA==
X-Gm-Message-State: AO0yUKWmEr4zi9aR0DhCVzIG8Q+jzSgtGTc7waXFsipZWLlW7MkowzG4
	FK2XYlahJexhQV0epjRAztDYT7Ru4GjednMn9pNBLkIEtKhLXqL9jqym+ZBqHBVPky1L0Zin6qu
	JbUlUOBPedfD9JPtp+2BGgBzAQ0VsmHEtgQ==
X-Received: by 2002:a05:600c:3d8d:b0:3eb:3c76:c23c with SMTP id bi13-20020a05600c3d8d00b003eb3c76c23cmr7113066wmb.3.1678569468682;
        Sat, 11 Mar 2023 13:17:48 -0800 (PST)
X-Google-Smtp-Source: AK7set9M7slBbIYfp+5lLYnIwPhkxARM9DEu0Ozv3smoxs6Ujc/ujPj9mKFPfZlvEK6hJ8UtGI24Sw==
X-Received: by 2002:a05:600c:3d8d:b0:3eb:3c76:c23c with SMTP id bi13-20020a05600c3d8d00b003eb3c76c23cmr7113055wmb.3.1678569468384;
        Sat, 11 Mar 2023 13:17:48 -0800 (PST)
Date: Sat, 11 Mar 2023 16:17:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230311161641-mutt-send-email-mst@kernel.org>
References: <20230310150620.115188-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230310150620.115188-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH] transport-pci: Remove duplicate word structure

On Fri, Mar 10, 2023 at 05:06:20PM +0200, Parav Pandit wrote:
> Remove duplicate word structure.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

a minor cleanup, Cornelia can you commit?

> ---
>  transport-pci.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index 01fb652..b07a822 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -813,7 +813,7 @@ \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio
>  \end{tabular}
>  
>  Note: When MSI-X capability is enabled, device-specific configuration starts at
> -byte offset 24 in virtio common configuration structure structure. When MSI-X capability is not
> +byte offset 24 in virtio common configuration structure. When MSI-X capability is not
>  enabled, device-specific configuration starts at byte offset 20 in virtio
>  header.  ie. once you enable MSI-X on the device, the other fields move.
>  If you turn it off again, they move back!
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

