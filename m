Return-Path: <virtio-comment-return-5293-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A814C7618D
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Apr 2023 07:32:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5130177F5
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Apr 2023 07:32:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4C5BA9865CA
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Apr 2023 07:32:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 442F89865BA; Thu,  6 Apr 2023 07:32:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 313EF9865B8;
	Thu,  6 Apr 2023 07:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341401620"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="341401620"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689578999"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="689578999"
Message-ID: <b030e7b2-213c-a06f-6f21-f7791adf9c27@linux.intel.com>
Date: Thu, 6 Apr 2023 15:31:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
 jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
 stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
 hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
 Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
 Max Gurtovoy <mgurtovoy@nvidia.com>
References: <cover.1680533760.git.mst@redhat.com>
 <b1445cf4f4702f4dbea74a3498e02a85b6cc702b.1680533760.git.mst@redhat.com>
From: Zhu Lingshan <lingshan.zhu@linux.intel.com>
In-Reply-To: <b1445cf4f4702f4dbea74a3498e02a85b6cc702b.1680533760.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] [PATCH v11 10/10] ccw: document more reserved
 features



On 4/3/2023 11:04 PM, Michael S. Tsirkin wrote:
> vq reset and shared memory are unsupported, too.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/160
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   content.tex | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index 1213d48..fca3827 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2985,6 +2985,8 @@ \subsection{Features reserved for future use}\label{sec:Virtio Transport Options
>   \begin{itemize}
>   
>   \item VIRTIO_F_ADMIN_VQ
> +\item VIRTIO_F_RING_RESET
> +\item Shared memory regions including VIRTIO_PMEM_F_SHMEM_REGION
>   
>   \end{itemize}
>   
Reviewed-by: Zhu Lingshan <lingshan.zhu@intel.com>

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

