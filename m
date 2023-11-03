Return-Path: <virtio-comment-return-8145-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9702CC4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CC3972236F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BADD2986C7D
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AEB1C986C53; Fri,  3 Nov 2023 11:35:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3C86A986C35
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 11:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4jJBsnroiu2ssfbjBcYwblenUzfTYhKdvZh/ajMw0cCeIFp22f7Gl76YFEiEmOuZtm0e4jSGZDYM7Y1qAKX8+HQN+BYLUKCjiEjB3PZ4rJ5UrStrYs04a/zD4DXYXXr8bSF7e9bqJKAEp4Up+29diGO0kyR/9cmCD0j+QtmQRT1GwjkKMrNJEHVDsSxShSpjeiOLS0maxdiLz2wMsHY+UvIgH4bdT9xsPm6J7vtDdzm5dyaGz4etVLYljVhiMGYPQKV6OCwqIjyaf45m5Fh41/EGg4ddeyPbM3UFHh15ePAtaAyjG8GZzl2A/qSFPmydv8XHZKI94Npo9uvXz/Y+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5rzytUO+ZeYWO/a9j/IepyUnyf1xJqrme49/C9n+Rg=;
 b=Do+tABVQhZV9e0qVnwlSXNzwIBvQzLPchXTO0vt338/CFo0d8sHZ5WSD89NxvkOuMQB+pgZSUFHWxiwVjOo7s1yN9kjekFBhs6m7VTPjYE6JFCymIw6vvV/4AqIY/2YDRnKaibbkVrE3cIcA7qk97v0wKXqBnEhDQPSrLZaAAJYtu27O/IR43TisFw06RljIV48bRAnKMQMHTm3vvYH2CpTjyFrzfw+ztvnmlulaLuJxNdY31PPPDloug7hGRaF17h0fxtg+GyD3ezOq5yiOfkKvOwLrdPp/Hrmw8BP67li4ww3sDBWAInkMwojSjUKRiw4iXusBg5MO2dYgzm3CDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 4/6] virtio-pci: implement VIRTIO_F_QUEUE_STATE
Thread-Index: AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSw
Date: Fri, 3 Nov 2023 11:35:05 +0000
Message-ID:
 <PH0PR12MB5481085F6E84FD2786FCD60BDCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-5-lingshan.zhu@intel.com>
In-Reply-To: <20231103103437.72784-5-lingshan.zhu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5755:EE_
x-ms-office365-filtering-correlation-id: 3130b085-0355-4db7-8fce-08dbdc60ed27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hvtE3kS5J3agZ10FtbiGeYnXe9sguYJSHmLu1TApAOVor14SPj7oO3/wxLr0WO0fwXtTBBtsJmrzQyBB43eYIHVbzUuDKhEPTqSb5morrd1/aTV+PrKiY08LzdRn1kw8TTbJ0nMye6BHlTvfCS99wBO24ZuEMVTKTQ2jFtryuJaSKp0HXTEGMRTSZbQBivphPYQozlaQltQ/9e38D8lftIUDPTf12/FH3PoHTLZLA+hGHKoK/fsxHYKS81wukTkqsr01w+J7banjHA5tC6+nv4SJ+lZXPAK9cJIcRC/qLBpvRDM6dbbU+Duo4fH1bkvcQi6ywTZpjLbKdIPmZHymE7takApj96DqLm6FbEk+mreSGGe6mwkZsxGMlUMZKsDDTlaQeSsB0XgG9/jxd5hFHQZOh6mxiQz0UhzBhA6ScpedvceVHC5gzNg/YMIYtsS6mUxm1Ffr4stY2G6eyMa/+QehjlpPnWgAZjLVZqFw/2Bvo/r7/ZE4Se5QjxJReDuidVypVnba481AltsvGNXL5zkDs8laJA0aCrhIJHvPFuqkHoakdhqHNs+k6qVoFJK4eNNsK+42rSn3hJXS4f5bLJT3ke8z4Knv9kBXnDJFj9PDEHH5253C069zLljQuhgZWMYm35C5y7OyhoLAt3m1Wnae59Nn4fgoGcLKVUOha+A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38070700009)(55016003)(66946007)(66476007)(76116006)(66556008)(66446008)(64756008)(316002)(110136005)(86362001)(38100700002)(33656002)(122000001)(9686003)(83380400001)(478600001)(26005)(6506007)(71200400001)(7696005)(2906002)(966005)(41300700001)(4326008)(5660300002)(52536014)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?epTXanxkrov3lSGnYljE4WfZ26Uc5VxRg0UaD8ccnIvk4RB+jUQRl4o5d0Pi?=
 =?us-ascii?Q?oq5VXxW2DSzE/YRlNxKQCBq8DnTlcW4zNxy1YRyL23Q/JHpyypo8B4EJmoGp?=
 =?us-ascii?Q?4JfQ0S6OsA3XRIcAYmJ4zULs1ebxdd677/1hUjzuSfQhUxtQvo/USeDaJbQz?=
 =?us-ascii?Q?vn6QvcFHZ+f1Edc3inH5WAn4Q5sT4zAgvHLBQU2HIsU8EiUqTLlbmqc5mf3n?=
 =?us-ascii?Q?R31pk/sNMy5YU7VfoU3kO5FUWrn2Vyb5ggt0k/wfD7emJaF9R3lcyuaqIzlf?=
 =?us-ascii?Q?9CgCQ0XL4aO3M9sxowcn25JU++I6HMJ4g523kYiJyKz+o83IJGCEmgGTJB7L?=
 =?us-ascii?Q?aijroEb9wKA21mePDr1PqzyNgwrGfQ3QAFmPXDxzxP8lXYDZAgwdtPQdEdLw?=
 =?us-ascii?Q?mn68syrwHXm2UpbfumHDLM+Vq7Y8koSd7wZWzryDgULgF6yp36KkijHlN+L8?=
 =?us-ascii?Q?smRUhBcHqFN9Y/Po5CibqP782bVxKTf6rReXY9+DbOXneP0Z2hw+u5tsQRZf?=
 =?us-ascii?Q?vtzTEbYisG8RXtNGgwSAS/eZX3CPU/tilXTaA8mfk9QrxxE1kdbbluFUeFPY?=
 =?us-ascii?Q?hgdpW428QOPfAxqmIDCgdMaM/t8N2FwAoyEu2QTs9F1/x/59KtZveYdVED65?=
 =?us-ascii?Q?lR+RKimU82khgbhkrcVBXzAXwS4XNcf1wETnREaDhMTxH4uzlygoM9ROeKIS?=
 =?us-ascii?Q?EWXze+E23wujFcbXe5ukxe7UgKTEasePLT2+j7YWhnTKGeG3PyDoRO/LQqq3?=
 =?us-ascii?Q?XslGjF5v+dj71MdWUTyF//suqfEs43g87YpAzjs0z7okz3QS/V9UNIIoptdI?=
 =?us-ascii?Q?IRcgpBwOufQEtWmzJQO+axk4z+bAIzoJsA+r8vOlx/5oreCNlbAF5amdra5i?=
 =?us-ascii?Q?c65R07yNqe9IGa4NF010mH2y7Gcl+bpeKseYYVOdhs0i7d9JMr8vFtNPjrA1?=
 =?us-ascii?Q?h30bb6Ww02OlTpDgm1qty7RaInfAQDpWyghMtg0xPp2WSd8Nsh+C+O7nxEwM?=
 =?us-ascii?Q?hpBsSGb0Uu99ghGs1V+/sx6YlGggneV8Kxq9YM96mAcQTriBenWb1PXV8NJl?=
 =?us-ascii?Q?1U5moOLAIAHGYF0h2UuoNHVomx3DAWP1zyefT/zxvJCHoMj6QfXWwS7Pjk8V?=
 =?us-ascii?Q?1rtIaj8YycWaPlbrQaUT8QzkTN3uj0Ep4tk+qvLjA6wbyUprfiJGmRXxkmvK?=
 =?us-ascii?Q?ocpnkkKi0WQfAampugv+qiDVJ0JwQpByW+enBLx2yi16TZ7V7tf9da22Mnev?=
 =?us-ascii?Q?SFhVe/gTRLmX1brpwMGUkfy8FuN9fy5RBpuDfrdXkki7987P5y1EqJkTUziU?=
 =?us-ascii?Q?F8lsDbjyPhMU7jFz6XlKh7RK0LXvnDFCsLEXrAsgcWPbvusOyGJAzoXdjjY5?=
 =?us-ascii?Q?hSda2fr66WIHOKJwiIUq78h+LXpl4zltwSh9ZCC4l/opWs14ocjfzYKd6x1+?=
 =?us-ascii?Q?H6SQldc/ciQ70/nS1zfb8eL/ilB5HpIOP9W4y77rcts0heAKRNEhQlHKmS1R?=
 =?us-ascii?Q?wG/3rjaXdpXPwne8bT8vCglEQX8ujfoi/xyZIYZdlntWSDtYTVMTmL+b6U8Y?=
 =?us-ascii?Q?JuI1Rj8EdH2oHHra9Mg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3130b085-0355-4db7-8fce-08dbdc60ed27
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 11:35:05.6342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MXN0RYrPU61BBsMiB2S1XDKM5vrRcYl1VDI2OVmSSY3Ripmb0TSEuXcZWME5zTfTdgW6jQ9E0YQQR0IkQU2lBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
Subject: [virtio-comment] RE: [PATCH V2 4/6] virtio-pci: implement VIRTIO_F_QUEUE_STATE


> From: Zhu Lingshan <lingshan.zhu@intel.com>
> Sent: Friday, November 3, 2023 4:05 PM
>=20
> This patch adds two new le16 fields to common configuration structure to
> support VIRTIO_F_QUEUE_STATE in PCI transport layer.
>=20
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>  transport-pci.tex | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/transport-pci.tex b/transport-pci.tex index a5c6719..3161519=
 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -325,6 +325,10 @@ \subsubsection{Common configuration structure
> layout}\label{sec:Virtio Transport
>          /* About the administration virtqueue. */
>          le16 admin_queue_index;         /* read-only for driver */
>          le16 admin_queue_num;         /* read-only for driver */
> +
> +	/* Virtqueue state */
> +        le16 queue_avail_state;         /* read-write */
> +        le16 queue_used_state;          /* read-write */
This tiny interface for 128 virtio net queues through register read writes,=
 does not work effectively.
There are inflight out of order descriptors for block also.
Hence toy registers like this do not work.

Series [1] is comprehensive that covers it even if you consider non-passtrh=
ough device migration model.
Where you can suspend individual queues using new admin command and get the=
m in the device context state.

[1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00472.ht=
ml

>  };
>  \end{lstlisting}
>=20
> @@ -428,6 +432,17 @@ \subsubsection{Common configuration structure
> layout}\label{sec:Virtio Transport
>  	The value 0 indicates no supported administration virtqueues.
>  	This field is valid only if VIRTIO_F_ADMIN_VQ has been
>  	negotiated.
> +
> +\item[\field{queue_avail_state}]
> +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
> +        negotiated. The driver sets and gets the available state of
> +        the virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
> +
> +\item[\field{queue_used_state}]
> +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
> +        negotiated. The driver sets and gets the used state of the
> +        virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
> +
>  \end{description}
>=20
>  \devicenormative{\paragraph}{Common configuration structure layout}{Virt=
io
> Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common
> configuration structure layout} @@ -488,6 +503,9 @@ \subsubsection{Common
> configuration structure layout}\label{sec:Virtio Transport  present eithe=
r a value
> of 0 or a power of 2 in  \field{queue_size}.
>=20
> +If VIRTIO_F_QUEUE_STATE has not been negotiated, the device MUST ignore
> +any accesses to \field{queue_avail_state} and \field{queue_used_state}.
> +
>  If VIRTIO_F_ADMIN_VQ has been negotiated, the value
> \field{admin_queue_index} MUST be equal to, or bigger than
> \field{num_queues}; also, \field{admin_queue_num} MUST be
> --
> 2.35.3


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

