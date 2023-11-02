Return-Path: <virtio-comment-return-8128-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122C7C4167D
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:11:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6EA3D2ACBF
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:11:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F19D986C09
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:11:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 46948986C02; Thu,  2 Nov 2023 14:11:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 37B92986C03
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 14:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fs0JgWNRf8EZcFXcGamd6YFAN7+9x0oMgNFyIDbBmtDkLj1omPF/nX17DWqy0urBXMrmV0zuZz1SWS3JzLggvyKTQP5o6HzOLCeZ+fGqYyehYvusuGW4+DrlPJ1AvMa2K5f4NAqagvtkif7twY69EHo4AYedsx4/Jv4AjyGAGeqWN5o4iQLZ5wnw1y5te342J1SMIvjGcQ6q9IqZbKSt1NUjy6x92/3XuE2JLs8n6HK+wbaBYYFj6ub4+f34F9QsmRDqOpp3yKelik2hmpkRkw36nN/P3i+SnQ6PNF9TS4ZSkISyZiqnDSY1VJAcg3LskGZZ6TmPqIuSZOG14iO3rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siuohepanV/M9nMeqMxWEndOGGEARZN/CsML3LgBTqQ=;
 b=eaQNgB+PnAw/P/C1HGaJfXGnpg11GLHtbxK577UrcBh+pnEybs5W5GAkTi0VQ3tO24KuZ4yYCQuKF9agc/lDhZZmvx7tNMvccslZ6aB5XKHrXsklzKV4sfllH/YbDnh7VKeB5V9hILdP2Ty6/geAbwQvP+s4WPCeH5bPOOkAR2+xv7EuwY6xMNNkexzrkW+28zdddN/jfH2gWwVX4e8Rwd9onYmkirvdnlbBJRCW+BLIgj7X1iWFTodoeGvtfBNz+uFtFhLSnWR1uFux63ZE2sFU0H/FHB0JMNaTpUpOadZVoJtHGOGDvaffHGjEM63EG18Px/bFcudVf+pDx4xN6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>
Thread-Topic: [PATCH] virtio-net: Add device migration context fields
Thread-Index: AQHaDY9RUGEEJ/qJr0+Cpuu9Mfc2AbBnDUkAgAADFsA=
Date: Thu, 2 Nov 2023 14:10:56 +0000
Message-ID:
 <PH0PR12MB54810652C4A50D06AF8A401EDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231102131946.1864886-1-parav@nvidia.com>
 <20231102093540-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231102093540-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB7234:EE_
x-ms-office365-filtering-correlation-id: 4980df85-c608-4dba-5f8a-08dbdbad880c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 U1q5ouKqYCz8/m2J0HtaL4m72ujB0c/sQkWwtop7a60tTgt5MkznwvW7F9n2+HCe+NTtXTIpqu2qywvUPQ4PqP3LFmNIHLsttKaFrSEo/wl99IUHtynI9VznE8AXxCH6noZKFqGwOJUQ0aLVAXQ4MZlwXKXPS0CmI1OXAKESum/UKCBk5G1MHwdyA5mNcdMv7lk/nD8+3NL/6T3ENa0s40vxJBzI1qjeWvz9r/g+aHNAby2oUrVzcs78qnXDWUjV3KkNrf+L9Kl1JVFjVEGXwLF1yvCCqc9fWBb/PrLNAJ1yFajjZ2oJOO3U8D0fdBoXQO/b8+U+CMIzH7zxs9gf0GW5wPSWqOCfLQ/N5l2DL/YEkGNTyzzI9lH1GmnGYcw1kaGbf6dsCQ+vsfN2702/bQk1Pb3GRgb910UaffqM/nrwUVvo3GenwA7P0ZvUQdBPu57YxRIUKAgHSVHwnioWuUCwzLOov6Awn2jX3IIdZpp6U3bwSzt8MrasWdymX49m7EXUKdr3qHdPdNdjHtRwUrAb0hYEYryTN9jBcKb6fxZvBvnl87pYxMMlDwlSwnY0dXXmxblWb3V2TgspP//EwOr9+XZXyF4SSiWZNxDKtoCVGmExIL58zfr4v4bJ+RiBZsEsqlUJ+XaY/XmjoOuDXg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(52536014)(66946007)(66556008)(66476007)(4326008)(66446008)(8936002)(76116006)(64756008)(6916009)(8676002)(71200400001)(54906003)(316002)(966005)(478600001)(33656002)(83380400001)(86362001)(7696005)(38100700002)(5660300002)(41300700001)(122000001)(2906002)(6506007)(26005)(9686003)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?scvSRVXLyrYUpCJLsC38yD4ZoVjGDN0J68oKxyh3XBgG8NSlaSXgGMJkZui5?=
 =?us-ascii?Q?8KhK2mF81SNQFShlPAr068cZOfocj2nzI3enrVpnnrudlWa3y1wDNovbdvfl?=
 =?us-ascii?Q?Iuu+Ru60ftGBSiZxNRSeEjXz26CjHgWETmi+53UDfRpKA5HRhlVuGetFqGnp?=
 =?us-ascii?Q?hIiLYC65YZ9flVph2tmjV3mk12yZqxQ5OJNojlVw7AGBC8VZkr271aaKdY50?=
 =?us-ascii?Q?RU9rTO4+kkNHiY6s/d+BLOhAbX/bFMh/U7jYe2JxVw9IjPXuCZyGj0mmfTGC?=
 =?us-ascii?Q?iQyHrIWZ4hwqkXv1CXne0SmsKGHdakecTaoJIGxos/NQSxhOxS/b5YJaxXHE?=
 =?us-ascii?Q?oa7V2at+HiaSYT83bDxvlj5Ig2crs/kgDV3N+UbZJSRRZgc9CYsNKiTDTqAT?=
 =?us-ascii?Q?5jmQoQLGw4qVQGnnIAZKKGVzUXd/31Y/9Jgc/6euYXY+Mh/TO0jeDDoRJOwY?=
 =?us-ascii?Q?kLQP/RRu2KCKJ+JZyjhOg3GyrVv9rY9hBBvhdqyXOyTQUXAl7iFjCGv3S3lU?=
 =?us-ascii?Q?JX57Dt09ObarwqlaD/y7OnlCkfggyDr/HRjPAHGAR/JddkBMOxgiQ6hi+WGc?=
 =?us-ascii?Q?cj/d/mFx0d38aBsSZCQGFvQa7hx3/yGITCpAfTRNjlcU5WU3NMEt/eOgiuWi?=
 =?us-ascii?Q?Z0AT7PkjVQIHSbqBsPKqVopAdOnRj/CTPvd+5V/85lyXIgygu3bN/wZKIsu/?=
 =?us-ascii?Q?CqXHQtjf1mfQXts8hgyQO+Y2c225DK9QbU1l5aZ6f2xa9sOc3w59jz44CLk7?=
 =?us-ascii?Q?NwFrI91VLctZ48W+0EzQsc7cYjDjZL2J73DmGCZCKXxyNQ17hEqjgp/YX7pj?=
 =?us-ascii?Q?H78M85L2iL9rY057MxMg58B6SB/hQi/T/DCL2A7alJKBFOzL6xVozdAaazmo?=
 =?us-ascii?Q?+oUqrqQQqLK2q39ntgihbWcXHJ2VLWNERC5j38A/XxBf27M5Nknofu9NAHFM?=
 =?us-ascii?Q?yws3qc3gSMhr4++N7YZ5jZ2grS9YgFWZxCmxlchs7HsWvj2EkEFL49khw32L?=
 =?us-ascii?Q?WI05v6GwJiCzp/L/QgEtFwUfcAy/DXSRlFVaZpah9G9XqGRJqgzTpHSyU6hf?=
 =?us-ascii?Q?FT5QOZY6d18M4Xf0yWIZLxBtVSlEKCgmlNquYiutqUYxzOmwnH/BXV62qyOo?=
 =?us-ascii?Q?twTMsF1NgzUjJI8Rhkqhztz2EIgCm2NtRe9UdWQIkejrrsWCrD/DxME67NaR?=
 =?us-ascii?Q?BaSdvLT4B0rYrDtQahCbN2UVSFibC8oJI6cOBVBrB3+00kM1pNxXH3Jn2tDW?=
 =?us-ascii?Q?tToBJiskb0Y5nQoGDng8KRViuXroUdWPMeeRwC0AJc2vyytL6petz028HEcw?=
 =?us-ascii?Q?AqdeHYFWKj+xN1Pely5buh6U6k/xfQPWrfxNKFd/g8AUhradd7srEfI51W8g?=
 =?us-ascii?Q?OoO8tH5H8OI7jhlygMKdhLDEEpiZ3rW1w3+E7KT1ZbaAQsK2OQPTn7q6G5rH?=
 =?us-ascii?Q?oIFaAQ5Ud3ZtWqccuCOGtV0EuFSPI/R2LFAlWcX/4LRGrNGbpEp2xswjjpYV?=
 =?us-ascii?Q?/HlGFOvl7B0TR03CDICQ6NVZswNmiaZSCZVIoxS5cp/5v/Vh02n1lboJS1hO?=
 =?us-ascii?Q?5GRrZKRVA+ClJG4/LtY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4980df85-c608-4dba-5f8a-08dbdbad880c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 14:10:56.1204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rbC9w1Tu5MLi0q03z2Im4UA+1f0Tf3Tp32pEX1XPl0Be/mket5xmbbIzVtbiXGbgBQEBD8fE9Rz+TqaUyQhpZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7234
Subject: [virtio-comment] RE: [PATCH] virtio-net: Add device migration context fields


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, November 2, 2023 7:25 PM
>=20
> On Thu, Nov 02, 2023 at 03:19:46PM +0200, Parav Pandit wrote:
> > Expand device migration context for fields such as mac table, vlan
> > table, mq config, rss config.
> >
> > All of them utilizes already defined infrastructure.
> >
> > This patch is on top of [1].
> >
> > [1]
> > https://lists.oasis-open.org/archives/virtio-comment/202310/msg00469.h
> > tml
> >
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  device-context.tex                  |  2 +-
> >  device-types/net/description.tex    |  2 +
> >  device-types/net/device-context.tex | 58
> > +++++++++++++++++++++++++++++
> >  3 files changed, 61 insertions(+), 1 deletion(-)  create mode 100644
> > device-types/net/device-context.tex
> >
> > diff --git a/device-context.tex b/device-context.tex index
> > ab19fc9..348bb25 100644
> > --- a/device-context.tex
> > +++ b/device-context.tex
> > @@ -57,7 +57,7 @@ \section{Device Context}\label{sec:Basic Facilities
> > of a Virtio Device / Device  \hline
> >  0x1000 & VIRTIO_DEV_CTX_DEV_CFG & Provides device specific
> > configuration \\  \hline
> > -0x1001 - 0x1FFF & - & Device type specific range reserved for future
> > \\
> > +0x1001 - 0x1FFF & - & Device type specific range defined by the
> > +specific device type \\
> >  \hline
> >  \hline
> >  0x2000 - 0xFFFF & - & Reserved for future \\ diff --git
> > a/device-types/net/description.tex b/device-types/net/description.tex
> > index 76585b0..13490ec 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -1805,6 +1805,8 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi
> >
> >  Upon reset, a device MUST initialize all coalescing parameters to 0.
> >
> > +\input{device-types/net/device-context.tex}
> > +
>=20
> I don't think we need to split this to a separate file.
>=20
I found it more maintainable but ok, will keep to one file.
> >  \subsubsection{Legacy Interface: Framing
> > Requirements}\label{sec:Device  Types / Network Device / Legacy
> > Interface: Framing Requirements}
> >
> > diff --git a/device-types/net/device-context.tex
> > b/device-types/net/device-context.tex
> > new file mode 100644
> > index 0000000..b78cf37
> > --- /dev/null
> > +++ b/device-types/net/device-context.tex
> > @@ -0,0 +1,58 @@
> > +\subsection{Device Context}\label{sec:Device Types / Network Device /
> > +Device Operation / Device Context}
> > +
> > +\begin{table}
> > +\caption{\label{tab:Network Device Context Fields} Network Device
> > +Context Fields} \begin{tabularx}{\textwidth}{ |l||l|X| } \hline Type
> > +& Name & Description \\ \hline \hline \hline
> > +0x1001 & VIRTIO_DEV_CTX_NET_MAC_ADDR_FILTER_TABLE & Provides
> MAC
> > +Address filter table \\ \hline
> > +0x1002 & VIRTIO_DEV_CTX_NET_VLAN_FILTER_TABLE & Provides VLAN
> filter
> > +table \\ \hline
> > +0x1003 & VIRTIO_DEV_CTX_NET_MQ_PAIRS & Provides multi queue
> > +configuration \\ \hline
> > +0x1004 & VIRTIO_DEV_CTX_NET_RSS_CONFIG & Provides RSS configuration
> > +\\ \hline
> > +0x1005 - 0x1FFF & - & reserved for future \\ \hline \hline
>=20
> Where are these 0x1XXX values coming from?
>=20
At beginning of the patch, device specific range is listed starting from 0x=
1000.

>=20
> > +\end{tabularx}
> > +\end{table}
> > +
> > +\subsubsection{MAC Address Filter Table Context}\label{sec:Device
> > +Types / Network Device / Device Operation / Device Context / MAC
> > +Address Filter Table Context}
> > +
> > +For the field VIRTIO_DEV_CTX_NET_MAC_TABLE, \field{type} is set to
> 0x1001.
> > +The \field{value} is in format of \field{struct virtio_net_ctrl_mac}
> > +as listed in section \label{sec:Device Types / Network Device /
> > +Device Operation / Control Virtqueue / Setting MAC Address Filtering}.
> > +The \field{length} is the length of \field{struct virtio_net_ctrl_mac}=
.
> > +
> > +\subsubsection{VLAN Filter Table Context}\label{sec:Device Types /
> > +Network Device / Device Operation / Device Context / VLAN Filter
> > +Table Context}
> > +
> > +For the field VIRTIO_DEV_CTX_NET_VLAN_FILTER_TABLE, \field{type} is se=
t
> to 0x1002.
> > +The \field{value} is in format of \field{struct virtio_dev_ctx_net_vla=
n_table}.
> > +The \field{length} is the length of \field{struct
> virtio_dev_ctx_net_vlan_table}.
>=20
> in bytes?
>=20
Yes, will add.

> > +
> > +\begin{lstlisting}
> > +struct virtio_dev_ctx_net_vlan_table {
> > +        le16 vlan[];
> > +};
> > +\end{lstlisting}
>=20
>=20
> are you going to document this or do you think this is self-explanatory?
>=20
I wanted to add to the net section as it is already described there, so tha=
t it will be self-explanatory here.
Will cover there in v2.

> > +
> > +\subsubsection{Multiqueue Pairs Context}\label{sec:Device Types /
> > +Network Device / Device Operation / Device Context / Multiqueue Pairs
> > +Context}
> > +
> > +For the field VIRTIO_DEV_CTX_NET_MQ_PAIRS, \field{type} is set to 0x10=
03.
> > +The \field{value} is in format of \field{struct
> > +virtio_net_ctrl_mq_pairs_set} as listed in section \label{sec:Device
> > +Types / Network Device / Device Operation / Control Virtqueue / Automa=
tic
> receive steering in multiqueue mode}.
> > +The \field{length} is the length of \field{struct virtio_net_ctrl_mq_p=
airs_set}.
> > +
> > +\subsubsection{Receive Side Scaling Context}\label{sec:Device Types /
> > +Network Device / Device Operation / Device Context / Receive Side
> > +Scaling Context}
> > +
> > +For the field VIRTIO_DEV_CTX_NET_RSS_CONFIG, \field{type} is set to
> 0x1004.
> > +The \field{value} is in format of \field{struct
> > +virtio_net_rss_config} as listed in section \label{sec:Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Receive-side
> scaling (RSS) / Setting RSS parameters}.
> > +The \field{length} is the length of \field{struct virtio_net_rss_confi=
g}.
>=20
>=20
>=20
>=20
> > --
> > 2.34.1


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

