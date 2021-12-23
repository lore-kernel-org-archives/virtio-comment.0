Return-Path: <virtio-comment-return-2465-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3579B9865D9
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Dec 2021 14:49:30 +0000 (UTC)
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
	<longpeng2@huawei.com>
Date: Thu, 23 Dec 2021 14:49:25 +0000
Message-ID: <d09a2b0c1cee4d2180b33c452a42794c@huawei.com>
References: <20211209140543.1876-1-longpeng2@huawei.com>
In-Reply-To: <20211209140543.1876-1-longpeng2@huawei.com>
MIME-Version: 1.0
Subject: [virtio-comment] RE: [PATCH] content: reserve virtio device ID for QingTian Box
 devices
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "mst@redhat.com" <mst@redhat.com>
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi Michael,

Is there anything else I need to do to reserve the device id?

> -----Original Message-----
> From: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> Sent: Thursday, December 9, 2021 10:06 PM
> To: virtio-comment@lists.oasis-open.org
> Cc: Gonglei (Arei) <arei.gonglei@huawei.com>; Longpeng (Mike, Cloud
> Infrastructure Service Product Dept.) <longpeng2@huawei.com>
> Subject: [PATCH] content: reserve virtio device ID for QingTian Box devic=
es
>=20
> From: Longpeng <longpeng2@huawei.com>
>=20
> Huawei Cloud is one of the famous public cloud providers, and its
> hypervisor is named QingTian. We plan to support the QingTian Box
> that provides some guest-aware features ( for high performance,
> security, etc. ) in the future, and at least one of them is already
> in development. It needs data transmission based on the Virtio, so
> we want to reserve a device id ( 43 ) for the QingTian Box.
>=20
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/content.tex b/content.tex
> index 899df5f..2a6f9de 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2893,6 +2893,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  42         &   RDMA device \\
>  \hline
> +43         &   QingtianBox \\
> +\hline
>  \end{tabular}
>=20
>  Some of the devices above are unspecified by this document,
> --
> 1.8.3.1


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

