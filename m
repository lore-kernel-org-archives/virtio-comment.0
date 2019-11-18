Return-Path: virtio-comment-return-919-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E601985CE6
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Nov 2019 06:04:59 +0000 (UTC)
From: "Huang, Yang" <yang.huang@intel.com>
Date: Mon, 18 Nov 2019 06:04:53 +0000
Message-ID: <0B92A36466FABC4D99BAF0BDB1FA8BBC415BA899@shsmsx102.ccr.corp.intel.com>
References: <1574057110-18854-1-git-send-email-yang.huang@intel.com>
In-Reply-To: <1574057110-18854-1-git-send-email-yang.huang@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [virtio-comment] RE: [PATCH] Reserve device id 28 for virtio RPMB device
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "Zhu, Bing" <bing.zhu@intel.com>, "Winkler, Tomas" <tomas.winkler@intel.com>, "Fang, Peter" <peter.fang@intel.com>, "Wang, Kai
 Z" <kai.z.wang@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Since the ballot for RPMB device was closed.
Reserve the device id 28 for virtio RPMB device.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/58


> -----Original Message-----
> From: Huang, Yang <yang.huang@intel.com>
> Sent: Monday, November 18, 2019 14:05
> To: virtio-dev@lists.oasis-open.org
> Cc: mst@redhat.com; cohuck@redhat.com; Zhu, Bing <bing.zhu@intel.com>;
> Winkler, Tomas <tomas.winkler@intel.com>; Fang, Peter
> <peter.fang@intel.com>; Wang, Kai Z <kai.z.wang@intel.com>; Huang, Yang
> <yang.huang@intel.com>
> Subject: [PATCH] Reserve device id 28 for virtio RPMB device
>=20
> Signed-off-by: Huang Yang <yang.huang@intel.com>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/content.tex b/content.tex
> index 2573bd5..7f54f94 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2717,6 +2717,8 @@ \chapter{Device Types}\label{sec:Device Types}
> \hline
>  27         &   PMEM device \\
>  \hline
> +28         &   RPMB device \\
> +\hline
>  \end{tabular}
>=20
>  Some of the devices above are unspecified by this document,
> --
> 2.7.4


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

