Return-Path: <virtio-comment-return-3155-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B83E9863A8
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Jun 2022 10:19:30 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220621100421.75356-2-helei.sig11@bytedance.com>
References: <20220621100421.75356-1-helei.sig11@bytedance.com>
 <20220621100421.75356-2-helei.sig11@bytedance.com>
Date: Tue, 21 Jun 2022 12:19:23 +0200
Message-ID: <87pmj28gk4.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v4 1/1] virtio-crypto: introduce
 akcipher service
Content-Type: text/plain
To: Lei He <helei.sig11@bytedance.com>, mst@redhat.com, virtio-comment@lists.oasis-open.org
Cc: helei.sig11@bytedance.com, xin.zeng@intel.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jun 21 2022, Lei He <helei.sig11@bytedance.com> wrote:

> Introduce akcipher (asymmetric key cipher) service type, several
> asymmetric algorithms and relevent information:
>   - RSA(padding algorithm, ASN.1 schema definition)
>   - ECDSA(ECC algorithm)
>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> Signed-off-by: Lei He <helei.sig11@bytedance.com>
> ---
>  introduction.tex  |  18 +++
>  virtio-crypto.tex | 351 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 363 insertions(+), 6 deletions(-)

Hm, there's currently a ballot running on v3... I assume you want the
changes in v4 instead?

Do you want to withdraw the ballot (and re-initiate voting for v4)?


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

