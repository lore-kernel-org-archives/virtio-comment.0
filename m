Return-Path: <virtio-comment-return-3448-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D3D3986434
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Sep 2022 06:46:31 +0000 (UTC)
From: zhukeqian <zhukeqian1@huawei.com>
Date: Tue, 13 Sep 2022 06:46:25 +0000
Message-ID: <2539b8caa9954d779eba9fae41ea14d5@huawei.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] pci: Update ISR related description
 about MSI-X
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Wanghaibin (D)" <wanghaibin.wang@huawei.com>, "sundongxu (A)" <sundongxu3@huawei.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi Michael,

>> =20
>>  Writing a valid MSI-X Table entry number, 0 to 0x7FF, to =20
>> \field{config_msix_vector}/\field{queue_msix_vector} maps interrupts=20
>> triggered @@ -1681,6 +1681,8 @@ \subsubsection{Notification of Device=20
>> Configuration Changes}\label{sec:Virtio Tr
>> =20
>>    \item If MSI-X capability is enabled:
>>      \begin{enumerate}
>> +    \item If \field{config_msix_vector} is not NO_VECTOR, set the secon=
d
>> +      lower bit of the ISR Status field for the device.
>
>I think it has to be set always. With NO_VECTOR driver can poll for config=
 changes.

Thanks for pointing it out. I will send v2.

Thanks,
Keqian

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

