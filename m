Return-Path: <virtio-comment-return-2929-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 33BBE9864DD
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Apr 2022 08:55:35 +0000 (UTC)
MIME-Version: 1.0
References: <50696.122041204145900103@us-mta-219.us.mimecast.lan>
In-Reply-To: <50696.122041204145900103@us-mta-219.us.mimecast.lan>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 12 Apr 2022 10:55:20 +0200
Message-ID: <CABgObfZEW9BPaj3XRca0JxZdY7JvGKaBWcq0PVda3O4J+qccQQ@mail.gmail.com>
Subject: Re: [virtio-comment] [V3 PATCH 0/1] Introduce virtio asymmetric
 crypto service
Content-Type: text/plain; charset="UTF-8"
To: Cornelia Huck <cohuck@redhat.com>
Cc: "S. Tsirkin, Michael" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, helei.sig11@bytedance.com, zhenwei pi <pizhenwei@bytedance.com>, Xin Zeng <xin.zeng@intel.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Apr 12, 2022 at 10:15 AM Cornelia Huck <cohuck@redhat.com> wrote:
>  +#define VIRTIO_CRYPTO_RSA_NO_HASH   0
>  +#define VIRTIO_CRYPTO_RSA_MD2       1
>  +#define VIRTIO_CRYPTO_RSA_MD3       2
>  +#define VIRTIO_CRYPTO_RSA_MD4       3
>  +#define VIRTIO_CRYPTO_RSA_MD5       4
>  +#define VIRTIO_CRYPTO_RSA_SHA1      5
>  +#define VIRTIO_CRYPTO_RSA_SHA256    6
>  +#define VIRTIO_CRYPTO_RSA_SHA384    7
>  +#define VIRTIO_CRYPTO_RSA_SHA512    8
>  +#define VIRTIO_CRYPTO_RSA_SHA224    9

Hi, should virtio-crypto really support outdated hashes such as MD2-MD5?
The kernel driver that has been merged only uses SHA1 or raw.

Paolo


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

