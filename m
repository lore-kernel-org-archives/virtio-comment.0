Return-Path: <virtio-comment-return-6912-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA37C0015E
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:24:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0D3D81FF69
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:24:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 042A3986852
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:24:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EEE569840BC; Sat, 29 Jul 2023 23:24:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DDF6F98680A
	for <virtio-comment@lists.oasis-open.org>; Sat, 29 Jul 2023 23:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9Clvgz9chB25LyiEu5+XCxuGkJUFgIeIxswhNK7deu/EgLeSGfrRQ4+7BT6OGuEdQ4LVEiUSr+hB/QPuKYRGGGa2AAUmgyUD0KB7WkQobMDVw3tJgntlvv7IsbmzZdw06IBj2HG1/zyH5mrVmjmYhvvimPc81BZCZWmHXVs2FoXhP9r8r4aZzayHhcS9Jsu69QC3nea/HI7RnioR0RDp4bRZXqxdg/6Ce3ft8VTx0Nb//UfoSo+NmAey7iZYjc/Ndky4QssESrJQw1Wthpvvd5Bn41BED+MwwFzFvWcC5B0dDJWQFnoQH4dxh0N8pkTBuiRCDoLJHkJ9DGPrTJQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGkl+CUZw0OkhtC7BleUVKRGEcI3F8rPKGqZMsqXV94=;
 b=VQO7Kx0MAMR6xLsre7OukrHm6GshY3p6882IklFarpWckNJKgSTL2akJ4uvGVoIGaNj4u4yde+785TiR2aGj3bf3C+Cxi0gUeGy/toiq+CRMs+Of+jBQTGRKpYAVL7aODvdNvAoyufH5IMBn+kGat1jZNZuE7KakOWom+e6eKD+Zxk9/ly+khxn2AIKiLP3PMxmp3JTDvgrrtCMoFmVkytB9WJKSgU6zhcLObwUIgRvO4l6vjBBtUqFDpzA9sJWpUeDUDrCnqM1drkO5+2MqsxxjvzE/xJMtc+vHJmaXi0CjRIl7wpwAPZFlYVxt6UILEjuW6uhL9657MpnJsUVVyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: zhenwei pi <pizhenwei@bytedance.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>,
        "parav@nvidia.com"
	<parav@nvidia.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang
	<jasowang@redhat.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>,
        "houp@yusur.tech" <houp@yusur.tech>,
        "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
        "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
        "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Thread-Topic: [virtio-comment] [PATCH v4 2/7] transport-fabrics: introduce
 Virtio-oF Qualified Name
Thread-Index: AQHZwnPUSACWog7uK0qtNmx6bUC1Zw==
Date: Sat, 29 Jul 2023 23:24:32 +0000
Message-ID: <39E44DB4-C2FF-4927-B60A-32947EC2CE94@nutanix.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-3-pizhenwei@bytedance.com>
In-Reply-To: <20230626072551.1709389-3-pizhenwei@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|SJ0PR02MB7421:EE_
x-ms-office365-filtering-correlation-id: 20932ed4-6ee4-4327-1a8d-08db908af6f9
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +4GRYh4XC+okSAxt0HZqHdsuAf/JdqgczBqldk9g4H4jAlbebeB9kYbbJKTjWEKk/zM1lTe5VqBYJsMTX9lPRNFNj4lAy/rEDERoYRu7UZBJSf5nvikfYLrA17VRF1rRwOnrfVLnX9K22rRnT/jed7am8w0TnIXQh9q9oxsQ/UKWQ4lPNB02HkSfyRsyXFCuKeudVVjxf9IeLawG7MJNON/P4ogpvUxkRJWPM/NWnyK1KyrmhoTRz44FGtAJyvgtpEu/d1ZSqug92OOgZdb0MSKHgMG752Ek3G3sFDgP4DkjECzgq3V5iq9sugPfZ09R9XUg9OXIR5WUQTq6HQFHQL7e0TF1o0DFUSfm+MdKWl8RUWfiW4aBRJ2kWaw4djrVYWTIre5AOV5S7TPCC+OMUmJOyy88jkhV6kl8A1oMMgKmxDzDz5sO6Uft7VK2V/Wt72e+VLRKiLe8QH4djkjYDzUvdWG9+yLn4t9Ik+mUTEZ/6eZdhr4SWO0NAWQFyF7TgUrkMjR41TofpkZecWkuoZH0VKeCnPEjFYBVaS0PD9xn+gX3261EnXAl6l/nTVtNGxV7iMCnhAewLyVs5nnx8mZyxLO+uTGKpTlRWW9r+KtBzjO3bhl4m+SvT6pnXUm2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB7938.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(38070700005)(2616005)(83380400001)(6486002)(71200400001)(38100700002)(2906002)(36756003)(7416002)(44832011)(186003)(5660300002)(86362001)(66899021)(33656002)(316002)(64756008)(41300700001)(26005)(6506007)(8676002)(8936002)(53546011)(4326008)(6916009)(66476007)(66446008)(76116006)(6512007)(66946007)(966005)(478600001)(66556008)(54906003)(122000001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7BMXM+mTKyE33QIa24Sipm5ajv/Rc6un5fOf9OayzcMj0pTNe/c6WNuE5c4N?=
 =?us-ascii?Q?xPORDsMCKgTUyjRSMo3t3CxF9d2F684Nhm8QVFbCkvwIs6Hru1qM5I2Asulv?=
 =?us-ascii?Q?gTYxTboyM3WeTs3E9qNVXlFNopGQja/PXgQzJnvQh2N7SQsjKSa5qEok9rXK?=
 =?us-ascii?Q?uZrmiKr01N4J+ZIAh/7S8C28/M+inKFaapGZ/hb8UC1E+4bFamvotPBT95dR?=
 =?us-ascii?Q?d7jYcsNc+A8yqsKlmKYStBWE8G+I6Ho+KmnVPhaiRIVlr+Kn18P988SkS4UO?=
 =?us-ascii?Q?ZzH9xcX7m0mVIi43ROPUBfsG1lZryiOWqMc1Go75bLNqH4Xp3ImFJCLahBCz?=
 =?us-ascii?Q?t3K0tEq9c89j834eGI/A5Kb5kmviCGhLoz6UzKbfNSyL8/CMzvKWaaCfIsgn?=
 =?us-ascii?Q?lAd/tGoH4Hnd9IExCUwT/rx2JxAfFU1V0FdD3YEY4jwlY6hRx2BUO3CEqAHm?=
 =?us-ascii?Q?eqVC3SGzVQksSOWBStxTBK44Pq0mriHSeJfB7fX6gL6ReVf+6UDcFxT8u/cD?=
 =?us-ascii?Q?ojbOkMs7vo8nKYeku9a3AhktMuJMlgmGgZ6A9X3+HN8BPZ7yhv3o4fSUmQcF?=
 =?us-ascii?Q?/j/fPJdiAALoXiGFc3HXu9mC3UMl/n48dbOgv22aJ9V13SPNJ6AZCt5k8h4M?=
 =?us-ascii?Q?lUugp5/QfTIHo3rAx0nmkRfUN96GwbOrA9ui0fL4BqRDGcCKunfhwOiMkuh0?=
 =?us-ascii?Q?ddK1RaS59EJnLCTsza2ISFZ8TjkyTt/RQxYeA3MDJs6JdflO6aQcj5DZylFA?=
 =?us-ascii?Q?jl9AIKuT0GHe9DeFYW9vUo746cGLExqAyJ+JDhXF+N8mjeNxa1Zk75Xg+C+h?=
 =?us-ascii?Q?x8TLAVHlsTKVR2/6AMKruV0Yf8mhtbdLtxvT1h0CWiPTzupgCPsQHjFVGLTd?=
 =?us-ascii?Q?li4xoU1ZuysFwcyaol1n2PreqwNvuVkr1UvBcOBK7JXKMElcMFjNnj7G4OJM?=
 =?us-ascii?Q?ado25sPPcGi9fo45Wsa0iUqHcpIZzVBVMZiG+J8PALapk5ZcFm28kz27X2oA?=
 =?us-ascii?Q?KipxT10fKm1fkBiXCBcc1nm5fnUX3xCpKtP2qbur7lfKrxQpVgiVTj8IorQ2?=
 =?us-ascii?Q?KtkN4tsss4J9dtptTzP+q754BKK95JHAHlYCc8lhjUrjCPelAQ18UByAqEQx?=
 =?us-ascii?Q?SbPUV2TUqfcbaPVFTnwJG9bRAEcdZq7kyrbOwx6RolEQxgy+SMonFU35ra8j?=
 =?us-ascii?Q?13AQ1rdK93F1bWnPDlCSR9Ipnr3JVxsRrrmNz1N8O/HbLZg283S2sWs9VJPO?=
 =?us-ascii?Q?Az/tlPRflTkVaeo3MGDe799wpff+fJ+quSWJQBzTqgXc8CfyL9ExLTQaqGvb?=
 =?us-ascii?Q?6pIL5176uAi6iYCdY0HD/b3YjLeHtNDZMqMNJRTCGhkr/rqnkf/3ZY6ELU2+?=
 =?us-ascii?Q?74lJPN1IqDXY+YDRqm7gAX3mjCYv5j94lMNDHyNQlLenOntxq86bqW3eNpL2?=
 =?us-ascii?Q?EcaREsMYXUVWPlSrG4i9XuMi5zAfih+b8bZfGSyRr+H/bYJA9iitIQ4OGGp8?=
 =?us-ascii?Q?5+cgFuDmSJTQN20rrUQ7pyAZ97MHNt0UI7c40rFIt6NV7BtrKLxBxlvGA1xe?=
 =?us-ascii?Q?Lo6nLehQ4u+KTxrUrR9SLbjlTrTBnkJJal3jmcC/HtobPvj+NZWkRZ78w6uF?=
 =?us-ascii?Q?XQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DBD9955104663A4A8A0F5006EAA0B57C@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20932ed4-6ee4-4327-1a8d-08db908af6f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2023 23:24:32.5940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtSqJ8uHgjVaBIS4UaOdMrFKNRbPsAfvG3rVOdhsa0iymg/UkTw9GEe0EG/cVVNrcP9Flq00lkKdtn8EWZfmL7153uU9yfHgcvNYqiuHFtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7421
X-Proofpoint-ORIG-GUID: 0eC7g_AItjBp3WANnyie90Fn3fzWwwAX
X-Proofpoint-GUID: 0eC7g_AItjBp3WANnyie90Fn3fzWwwAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Reason: safe
Subject: Re: [virtio-comment] [PATCH v4 2/7] transport-fabrics: introduce
 Virtio-oF Qualified Name


> On Jun 26, 2023, at 3:25 AM, zhenwei pi <pizhenwei@bytedance.com> wrote:
>=20
> Add VQN section. The VQN is a little different from iSCSI/NVMe-oF on
> style limitation. Because iSCSI/NVMe-of is storage specific protocol,
> the full string IQN(for iSCSI/iSER) and NQN(for NVMe-oF) represents
> a "storage access address". However, Virtio Over Fabrics works as
> transport layer rather than device layer, a URL style string is better
> to Virtio Over Fabrics. For example:
> virtio-rdma://192.168.1.100:8549/blk-device/nvme-pool/849a39ad-8d7b-4a7a-=
adb6-e7407ace532c
> virtio-tcpip://192.168.1.110/blk-device/hdd-pool/238151a7-acd7-4621-bbdf-=
382ddbccb6a1
> virtio-tcpip://192.168.1.100:8549/crypto-device/25307f22-e5a8-4ea2-b7ca-7=
9f5c3bebc3c
> ...
>=20
> A hunam readable VQN is helpful to maintain/debug/distinguish.

s/hunam/human

> Note that this section only defines the "VQN" schema.
> For a process, the following two are both fine:
> ~# ./foo --full-url virtio-rdma://192.168.1.100:8549/blk-device/nvme-pool=
/849a39ad-8d7b-4a7a-adb6-e7407ace532c
> ~# ./foo --transport rdma --address 192.168.1.100 --port 8549
>  --tvqn blk-device/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
> transport-fabrics.tex | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>=20
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> index d10be2a..54d7558 100644
> --- a/transport-fabrics.tex
> +++ b/transport-fabrics.tex
> @@ -30,3 +30,18 @@ \section{Virtio Over Fabrics}\label{sec:Virtio Transpo=
rt Options / Virtio Over F
> which executes the bulk data transport on virtio devices.
> \item The arrival of data on the Virtio-oF queue indicates that a notific=
ation has arrived.
> \end{itemize}
> +
> +
> +\subsection{Virtio-oF Qualified Name}\label{sec:Virtio Transport Options=
 / Virtio Over Fabrics / Virtio-oF Qualified Name}
> +Virtio-oF Qualified Names (VQNs) are used to uniquely describe a Virtio-=
oF initiator
> +or a Virtio-oF target for identification.
> +
> +A VQN is encoded as a string of Unicode characters with the following pr=
operties:
> +
> +\begin{itemize}
> +\item The encoding is UTF-8 (refer to RFC 3629).
> +\item The characters dash('-'), dot ('.') and slash('/') are used in for=
matting.
> +\item The string is NUL terminated.
> +\item The maximum name is 256 bytes in length, including the NUL charact=
er.
> +\item There is no strict style limitation.
> +\end{itemize}
> --=20
> 2.25.1
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>=20
>=20


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

