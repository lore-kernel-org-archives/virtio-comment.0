Return-Path: <virtio-comment-return-6255-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006F8C7EE29
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 17:01:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 239FB6008B
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 17:01:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1253698667E
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 17:01:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F2500986676; Thu,  8 Jun 2023 17:01:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E0C58986678
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 17:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXihwh9c1IxZC3itdH+xuKvYA5Er9IKoC1AXo8ZgLhg72cGM3ktUkYrS5yvK42L6kBaSnBSj1a9fNn6kNFUs+/YWVEij3k2At3Ngxz3E6QqC8uNm6aZhX5SCyjNVRWC8QchifmHqx0zT/6Tn/qjSLOHVUDACPoLJ9F42lAsbBFRGMj9q8QQXUoKny3+qhJoqohRlqBjzY2fHGXEXtLX2O0r1pn4enVBi/fVbeHDN/j3TtIxRG6pl2iQi58wJfkYaPajJ9726ncUPzU2ZOj6bw0gyIY7h226hl/H9NCHySWsYuNTGVIGoUWnYPcF16hikByMHih8pszjH+vdY2xEG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+zqnj9mwoCrUvUXbZ1Zc2XGcGshuDBwPgxOsIpL/sc=;
 b=BgAlW6ddd6yFrH0CjJgjkU+w2+W+VtoXyvgNEBwKDqlfNwjp2XMhQTotrW6q+CWUwAcKZOIRFMV5asLaOaxdcW3huGh6Pd/Ic/bwkZS8JcwbcOzJ9+e0awdBqinLPx8qpB4mXu2Q+n1VW6F67DCrcQRYam8KTECDF5oqQIHflLqgE43aEoUG2SB9lfXT11RZqwOl61NAHRFk2GWMnjg0NJqK3K+rBF9CmZiLLdOxatYUBfLi9FuKM33Di0uqCNt9kk0uTH9aEwzkfvSWs//57AM/3WUQoA1PfYdANW9UfiwpnVONO6gk2kL1fWtatuweXI5jSbtEmCC7DAGTM5b1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, zhenwei pi
	<pizhenwei@bytedance.com>
CC: "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "houp@yusur.tech" <houp@yusur.tech>,
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
	"xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Thread-Topic: Re: Re: Re: [PATCH v2 06/11] transport-fabrics: introduce
 command set
Thread-Index:
 AQHZfmF2m1yu3FfKeUGpsXWnsx3M9K90yN4AgAJcugCABXPNAIAAlxGAgADKFQCAAOCkgIACeCyAgAADBvA=
Date: Thu, 8 Jun 2023 17:01:19 +0000
Message-ID:
 <PH0PR12MB5481C447A5FCA25A6D5B28E0DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-7-pizhenwei@bytedance.com>
 <20230531171036.GH1248296@fedora>
 <8cfdc9bf-03c9-92fc-f2e0-d59b180b0d82@bytedance.com>
 <20230605163046.GB1624556@fedora>
 <54bb85af-7979-8226-cfef-d72c1cf2332f@bytedance.com>
 <20230606133444.GC1958291@fedora>
 <86978fc3-c065-5a64-2996-28b4eb2b40bd@bytedance.com>
 <20230608164123.GB2240319@fedora>
In-Reply-To: <20230608164123.GB2240319@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB8002:EE_
x-ms-office365-filtering-correlation-id: 0e3ceae4-d39b-4fef-afe9-08db6841faeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 T8LOs9qA5u2FZnRyP9IXZAhn7gf+iJR+d2RY1SwpIASL97DotPMaSm9z/39SPmsqiyP5sk8Ul4f54UF04p7W4J/LBKojRVEq4P7SfQOTQwmsLLSvP4MZLxDhHTiSzZVU+ncPBNLTPB87ikSSb9CMpBwfw9PgHBeWIpavnv7nwTojI3eHGPbwpOnkP9Gc71RGDOrcmdxdy7jVDcSeg5UB65noWumG4isGhhjNYUJ6bEAX9dO+c+uWYmnumW+8E0c68xA0wlJOFsAQB2WZ2lcJYUs6+CX9YQcd440s/4wZtyQe+vZwd2GRAMTM9IAfzCQm3IMLdkxVXp7OQEdOUoi61Pce77y3gt9Sl6yhTKauj/qLP6S55yFRo57RVLB9Hh38ECK0fuSI50vZUIwhcdQKWKOgPNN8KGih3cEIQQaFnHPUia/mQGA+V+NFLj/dF5foreBpot1nBWEv+4RAiztAGEe3t/MABH5IenYC8UwWs0n2eDniBnIvF2o16AYWWHLD+grumzk0FFkX5YQu7dasf1Pp9SvTABIhoOWl2PWA6QE8J2mgpG4UEAjifrzOmtmGA5QoBGVTFCD9yU5XjtH/zyIOH7qD9QlZr4auIRJ/TW8JumIGh0c3j5Wogx1RS8CM38bYw/Nnpwpf3Ibiwb/4Fga0ksEJI2muKo3igqt7j8s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199021)(966005)(7696005)(316002)(41300700001)(83380400001)(86362001)(38070700005)(9686003)(6506007)(186003)(26005)(2906002)(33656002)(122000001)(38100700002)(55016003)(52536014)(5660300002)(8936002)(8676002)(76116006)(66446008)(66946007)(66556008)(66476007)(64756008)(110136005)(54906003)(478600001)(71200400001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pMc9NdFBkWGK5A0E4au90ZRn1snh2A9lB9A8cDchrAuOhZeArjbvrwVrMtdj?=
 =?us-ascii?Q?KwoQZ/UOi5O2fxmoCgem/k9mk8S2jDXgHUcxTS2ixFKXms/DKwDxM60aOh0J?=
 =?us-ascii?Q?ENg42XoCu0A0q1Q25uxzoEWyN9jEcW5a2HPUXUvC1CZyrPEeRZXbvSnyBih8?=
 =?us-ascii?Q?3Vw6G3jOT3PANRuscEjHHzv4koGJKUBTrXf6/TzV6sA6FcnHHNM7xGr2HYEF?=
 =?us-ascii?Q?ocoWTc5/hk2MgqZA1jmgV4c3/SVdi1EbMOY7wVRdzQpnt8d4pMsVo7SNxRVH?=
 =?us-ascii?Q?7HX6BUN8ZoV3H4ZaSZrrzbMzVa+/lS9Ul7WaXlVt1CXQaDNWkTmzRfoNmNmJ?=
 =?us-ascii?Q?GgkGcUrw3CDT+1FHkCezVh4ISFoQVucO1XfAfMHNeznFWiCFXkrwMO0duNbk?=
 =?us-ascii?Q?jtoEWH1stCmPLS36mlftdbroxVqVA6RemGRBjOB3f6UoObmQs1HEu+vUdK18?=
 =?us-ascii?Q?VvXxTTSSmj5xyH+LloLHL9hL2VxIYwwmcze17seiTIhbHAhG5tfuQBHdZV09?=
 =?us-ascii?Q?OvyRysfUPBwmgLDkqea4UntTHhhWJ++xZmMnU+pImDKzipH4z8JGH/BQOmOT?=
 =?us-ascii?Q?o8vY0armhw7cEBdH1HhXQw86zSrnSsttd50k9t8AjzoxQzCRCG+1gj6c6ljq?=
 =?us-ascii?Q?CK5CjTrIjnw2pVQSF6SxWgKXNFbTPbBHELmiSzViAkdubjTsqYS0mMjjCB85?=
 =?us-ascii?Q?8zuD3PMVzTayBdsZw56H17Hy4Bd37CkZ4Jq4fSujuWKhkXnevFPoS0/ycRHw?=
 =?us-ascii?Q?QO0rhD1w4gIocioZE4dkIWkOitFa9HvYC7ck3N4cZCNiX0Oi/49xg3fa66Y4?=
 =?us-ascii?Q?gL7+8U6OjKcWMpKuUxdWIYT2TU9RInEUP/zV8rqyI5TCHxTjMNJXHugsD943?=
 =?us-ascii?Q?/KvxVnJjkZHE5ymDAhe5G/WDEIOxc55P/VJDbqv+PrDetd5y6MQmiOZZAHhd?=
 =?us-ascii?Q?TNVCMKTv7pJC4FjfkchsLis1JpYDDhgYl4XF8jzvKm5Zmf+vANKfDws0EuKM?=
 =?us-ascii?Q?r5D/azOSKrst4tlr7HT42NNKVwDq2+H8Y2YdhO1ZQVl3ChXRsUpGLDAsuSG1?=
 =?us-ascii?Q?576Qm/f8s49G2VN8AZnbiaOZtiGRJXmRfkJONa/iXR2+EJdpsgNu5d6vYbI+?=
 =?us-ascii?Q?WNxnDEa/56uy6pCprFUWA11KzA1PygHuSyWdrO9D4IjS+slMlmuRKiNMk/Ri?=
 =?us-ascii?Q?1OI9UjnCPUKmtYeCOPZ9xPeOL66WeWc5bmvSbA2ipv+9x8A3bahfSVhzA/c5?=
 =?us-ascii?Q?c79I/aYLFYxuYvNih9idptyg3+zz8R27Uca7RLvm0+Fe8+vO4mpakib46hGo?=
 =?us-ascii?Q?n2BlcXFVhdTTbw6tuKrZ/ZZKhUpjotiwMK1Xg4iuoWdvozGI7M2RZmbvTI02?=
 =?us-ascii?Q?tZBkz1l2x3cCzxVn4fPabAj5HXpmRLImT9yFJCDICAjqlc7/diEt3rBrh/LC?=
 =?us-ascii?Q?BGsWP/UAoNxZ0fmo5sA8j+hlUBdxrzq5o1/EWk8iFO7roevaa17pYBhcld90?=
 =?us-ascii?Q?DHJhcQYt9PkRLyc72MfP2P8SPPg399A48Kv6CaRThqEkSnLAO/A2276FjEq0?=
 =?us-ascii?Q?r419q/nG4OwylWaevgw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3ceae4-d39b-4fef-afe9-08db6841faeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 17:01:19.4406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4tsBOSOZ1XuRXI8Gw4K4aF5XYHvrn6Q5Ryh2ToFz+/DnMSwwP7AUrSJTYcYjtvbUztC99Ch/LFL89/pZ6T5ekg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8002
Subject: [virtio-comment] RE: Re: Re: Re: [PATCH v2 06/11] transport-fabrics: introduce command
 set


> From: Stefan Hajnoczi <stefanha@redhat.com>
> Sent: Thursday, June 8, 2023 12:41 PM

> > > > For stream protocol, it always work fine.
> > > > For keyed protocol, for example RDMA, the target side needs to use
> > > > ibv_post_recv to receive a large size(sizeof
> > > > virtio_of_command_connect + sizeof virtio_of_connect). If the
> > > > target uses ibv_post_recv to receive
> > > > sizeof(CMD) + sizeof(DESC) * 1, the initiator fails in RDMA SEND.
> > >
> > > I read that "A RC connection is very similar to a TCP connection" in
> > > the NVIDIA documentation
> > > (https://docs.nvidia.com/networking/display/RDMAAwareProgrammingv17/
> > > Transport+Modes) and expected SOCK_STREAM semantics for RDMA SEND.
> > >
> > > Are you saying ibv_post_send() fails when the receiver's work
> > > request sg_list size is smaller (fewer bytes) than the sender's?
> > >
> >
> > Yes, it will fail.
> > The receiver get a CQE with status 'IBV_WC_LOC_LEN_ERR', see
> > https://www.rdmamojo.com/2013/02/15/ibv_poll_cq/
>=20
> Parav: Can you confirm that this is expected?
>=20
Ibv_post_send() will not fail because it is a queuing interface.
But the send operation itself will fail via send (requester) side completio=
n moving the QP to error.
Receive q also moves to error.

> This makes it hard to inline payloads as I was suggesting before :(.

What I was suggesting in other thread, is if we want to inline the payload,=
 we should do following.
RDMA write followed by RDMA send. So, a Block write commands actual data ca=
n be placed directly in say 4K memory of target.

This way, sender and receiver works with constant size buffers in send and =
receive queue.
RDMA is message based and not byte stream based.

Inline RDMA write is often called eager buffer, similar to PCIe write combi=
ne buffer.

Both doesn't likely work at scale as the buffer sharing becomes difficult a=
cross multiple connections.
It is memory vs perf trade off.
But doable.

We should start with first establishing the data transfer model covering 51=
2B to 1M context and take up the optimizations as extensions.



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

