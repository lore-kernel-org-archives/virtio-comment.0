Return-Path: <virtio-comment-return-7738-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45D7CDB484
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:54:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1639E799AB
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:54:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E35DE9865F6
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:54:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CD3A898643A; Mon, 16 Oct 2023 16:54:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BCD4B9865D4
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 Oct 2023 16:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GI7kXb9PBsXP80taq0stsXPMuZUlH8ARft1pzBfBcC5r8LaFEzxlCuyn67TrUQaqaow8QR0jujjkBXUnhpq5JBfQs3KlInuFzfEbIKddU5PjMbZUnIuzg1kIHmmvPu6KAgBRsvIywW4fGiUYvHE59e0UAMEjunk3O2G12JAd/rxMMTSyLviT2ZvqqsAMWCekSTp8zOQ75Lf32oA8vSuZimZRu17vH8MJW1zCF+9LOZDiZvDAN2NQ80jyLbFlK9VO1O0kgTGrjTCkznP+kxgGCDjEIHXnrAwbwYmQn7KBRpnnJTQrFvpcjZWNqF5fME/KaPkgjzPC8ocjfyw7EdCmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flosytuONoEUsKJc2SA2QTUFBqyGIMaQAI+AmFQtElg=;
 b=njut22iUxXnSZlCtwcZS2H/2PVYOb4Qx7FzIwKOp9SnShtZmqnRokc35HGTTMMKaM9R6c1Rzzmj2iR1VqhYiJHlQZR1yNxJpGVp0IOQdmm2ZU9XqiY4FtqRHFj+lynidDPIDb7W8j7f20xCGXfzkhdqhG/pmEu01dYbvRsqEpSHr7pFEbBfBVul3KShoZKcAQTkE+mHlxnhdXPhtepg/pcVNSMiWGfnZJD3uV6TNoquEGVF15d/0Jtxnu0xj/BtUczntjoGgGFx731WliYmi/lwGP3OmQrAH37IttuZT2qllba7a+gUUw8WUXG+bKPa3TIx5du9MLwfb0tz6p1dg/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v1 7/7] virtio-net: Add flow filter device and
 driver requirements
Thread-Index: AQHZ+N1WaEliDcbGHky4ofzJVc5zpbBLkDaAgAEgfiA=
Date: Mon, 16 Oct 2023 16:54:22 +0000
Message-ID:
 <PH0PR12MB54812504AD83992BE20C720CDCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-8-parav@nvidia.com>
 <SJ0PR18MB4477132D1F1D21178F4BC238C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB4477132D1F1D21178F4BC238C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA0PR12MB4544:EE_
x-ms-office365-filtering-correlation-id: f2c7c67b-013d-4073-c945-08dbce688c1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +kh0ZPyYsiVqij/cNnF+4oBLh+UeH9bt5JwTnoxrkfzecH5R3UqYOyAXteujPHal8x5TBLuz00I1WEvQ0UfJG06AcCfrg69vvKCZK4y0qtJeT6NenKHNAvzEw77mKWUEiWSZ/Vz60mirSvTfdTlluLHmAizhAPjWL6F26Jqnuv3J41ti6wCK76lbooLEG1xpKudJDRNrXs2tcmCEgdQn7pbU5rPUK9yuqC8KlXjYEzBYseJT9t2FWOHW/GBJIdVZ4UgZ+cXi0XMKZKA2DGitRSyOC2xJ6MDT7KzCrSShmYwwaUt7Ut1d0Amr9CMPDrIYk6Du0WHS51URUPB9Sd0VtPtwnSFr0oNP6nbkC3Z+F2aoxOwkdMBKcDqS+9JjrSe3t1IjsUhsOPdm2kIgoqze3fKimv5nDde/jFVs92Io8EXY/kjglF5AQ9oW74wiVofmjSGSvJHKiXf5gw9DpBGMPI5p4/JSXAH185mp7amvf9UT52W9QBWjr58EIWNn9RFeF3t/Mso4k/jnI6qdGfAWeSAjp3iGB+KTaB9J14VEoZEQw991QCNJqoBNq+wChi57Gr/QdV/QVadQpPybMgcswM5228psrfe6vPRZpKO/rCxkIqAXY+zWABvPbgdoaFIq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(122000001)(38070700005)(38100700002)(71200400001)(9686003)(6506007)(26005)(7696005)(76116006)(66946007)(66556008)(66476007)(54906003)(316002)(110136005)(66446008)(478600001)(64756008)(4744005)(33656002)(86362001)(2906002)(41300700001)(4326008)(5660300002)(8936002)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HN0UXJtdaJoGP85v0EQnxzrGpyh8p+eikGZgzwTkF8Dk25HTkJwhU4XuyWkU?=
 =?us-ascii?Q?BSqMrAvXYzZOofDM43sS9QiPq92J/4cbJWfvT4npFHEvPTYzEx+Cam2BB5fo?=
 =?us-ascii?Q?pPHlB0/fknYefJj+zAu5s0/LBTcEOhcx3qdqCh5YpgVYGhrD2nrimiMKv3Zo?=
 =?us-ascii?Q?q19Ex7+IhMmDj70deRt2XgKEYVv5ijFIx24xgx1O3Hd6ioNTBC8VV433fI/F?=
 =?us-ascii?Q?Tivwk5tXn+H+3Mn3F8Nru/dxeRc3q4GH73CmnR8esgsJp2BStEXwVjWH4+8T?=
 =?us-ascii?Q?dgHpeybcD77wFv7+61SiPZLIVGZ3uEHw9DN77gXickXHFM72a4PoFzeNkFR4?=
 =?us-ascii?Q?RpMxAuXSWr5boSjVqnOfelwyJ4eFA9UKz72pWrHNO0NWqyg+RvJoaQLzOTks?=
 =?us-ascii?Q?OCje0M34dldqigh5pZPD/ANPnREZsrhH6EnXqIeB9RB894UZtz7BA4wkCpK6?=
 =?us-ascii?Q?qfUu5Ubxa7FyHg9cTJEC0MqsPHA11vp5o8rn/Rm7ZyKKCNlvzjcaRXD4TiLM?=
 =?us-ascii?Q?dieREY8ZwC+Z7RBS5Zkd0IKHyYS44nWnvnVOdQfcAWx9mLWYMmxzqn7fgQ5n?=
 =?us-ascii?Q?hAjv/MM+MrOApsBGFGRO3H0BMWGgqkzhdcFgd1jxikGxg7dX/6vhLxItY2kO?=
 =?us-ascii?Q?/p7FI79PTrOZ3iM6EdvYNHayQ1+7bMHrqxRBNTYa/3syuqHMYsIyDZBrdwTu?=
 =?us-ascii?Q?qhB7uiZASehq7ZKONzytOwa/m5EOPkS37XgLKu5aJcPNiJvHAbYm44BATDv7?=
 =?us-ascii?Q?G2j63zgQvol23kT7JBRo8mFRA+ufY84g3BX92HRhJLkjRJ8bGgmhaWRZAl7p?=
 =?us-ascii?Q?8QO9uNp5UrzLjlmTvzObAPI+mI+2OEp21S//+oC1EGFKq0lXoytRbhuUkAfh?=
 =?us-ascii?Q?wvakx3s5lHGqroaSke46OMWZb1/itw/HLj43lONm68kha3d2zFIUGLSeBNln?=
 =?us-ascii?Q?Q+Sl4FVR97mYSk8LbKG4ISYFN9GqUx7zR6n0i2HuJFLWW0b1jt20GRL4ennC?=
 =?us-ascii?Q?OZgvahSi6XTcSsxMsp3xS2OkCvvEXfUREzjIYLKtBLVVDU7utcgrcCOgy/4T?=
 =?us-ascii?Q?NS3gaWIAJnf2e9dU1+nVSTLewAgY2R6+A+pBs2UAn05AmmeR1Rs/oAxx06zJ?=
 =?us-ascii?Q?bHX7m3KONaJDxgqH8621mqNXWRVfZ6Rq9pgpuxCK9KNJCItX9T/yrYQON6hg?=
 =?us-ascii?Q?g9Vu+FJRE/bOJE0aMhnxAPqGbSKh/ZcJ3+LtyXHLfRG0kuUT6AaqGwOnDjYq?=
 =?us-ascii?Q?Wc5mHpw6XLcTp7qihmdOref1M19VyAVeQJm3H2TdHzLY5Z/mvoZnmDkhBWQr?=
 =?us-ascii?Q?YIDOg9GMRygbQ/zQOYn3ELx6wgfaietu4IuT/1JfK9CY65D0Ac2ClEHiBuXE?=
 =?us-ascii?Q?ybm1pUyOm9obM9uIF77el7EtpKme/Cl8veDZjXeGzm+uOyvKJ0r9kBUN9rna?=
 =?us-ascii?Q?bMgNZWkBz/bgzwyj0n4jHOUaG6TINpwRHKyxDchnMR7yq1pT/j5kK2pa2CW/?=
 =?us-ascii?Q?CeHK4zgAzwfObb/tgrOHJQSP5PzzdQqwccGgJ+ocSEgydPG8U5a46I/0ioVN?=
 =?us-ascii?Q?M0TCauW0rkHE74gKkos=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c7c67b-013d-4073-c945-08dbce688c1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 16:54:22.5275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JEMm5SBRrJ/iVDvI9TfBwTymbnBWTBMepZb+rMiuygKVDqBwOTP2UopMA1AGyJqXV7zgQqixLLCJVN6tHesSUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4544
Subject: [virtio-comment] RE: [EXT] [PATCH v1 7/7] virtio-net: Add flow filter device and
 driver requirements



> From: Satananda Burla <sburla@marvell.com>
> Sent: Monday, October 16, 2023 5:10 AM
>=20
> Hi Parav
>=20
> > +When the device matches the flow filter for the packet and if no
> > +match
> > entry is found
> > +for the packet, the receive packet processing continues to next
> > +level,
> > i.e. to apply
> > +configuration done using VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
> Did you mean to say that the device has flow filters configured but no ma=
tch is
> found for a packet? I think the following line is confusing "When the dev=
ice
> matches the flow filter for the packet and if no match entry is found"

Yes. It is confusing.
How about?
When the device perform flow filter match operations and operation result d=
id not have any match, the receive packet ...


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

