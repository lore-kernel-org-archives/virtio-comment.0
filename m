Return-Path: <virtio-comment-return-2398-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 344239864A7
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Nov 2021 17:41:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20211115074152.43427-2-helei.sig11@bytedance.com>
References: <20211115074152.43427-1-helei.sig11@bytedance.com>
 <20211115074152.43427-2-helei.sig11@bytedance.com>
Date: Thu, 25 Nov 2021 18:41:42 +0100
Message-ID: <87y25ci149.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [V2 PATCH 1/1] virtio-crypto: introduce
 akcipher service
Content-Type: text/plain
To: Lei He <helei.sig11@bytedance.com>, mst@redhat.com, virtio-comment@lists.oasis-open.org
Cc: xin.zeng@intel.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com, helei.sig11@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Nov 15 2021, Lei He <helei.sig11@bytedance.com> wrote:

> Introduce akcipher (asymmetric key cipher) service type, several
> asymmetric algorithms and relevent information:
>   - RSA(padding algorithm, ASN.1 schema definition)
>   - ECDSA(ECC algorithm)
>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> Signed-off-by: Lei He <helei.sig11@bytedance.com>
> ---
>  virtio-crypto.tex | 310 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 305 insertions(+), 5 deletions(-)
>

I don't really feel qualified enough to review crypto things like this;
is anyone else well enough versed in crypto to look at the details here?


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

