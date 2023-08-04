Return-Path: <virtio-comment-return-7018-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BD5C04A6A
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:32:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6B4AD370E7
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:32:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F67F9866ED
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:32:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 564AD9866DE; Fri,  4 Aug 2023 07:32:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 439D99866DF;
	Fri,  4 Aug 2023 07:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akujWoUAfvSsOIaQO9GFErvG2WHkG1CJch27ZaIfmlegBoOs+buy1ZLQR+AeLVKEU6d+HVRu7WMeD/7KRUFrTUpgK5zp841SiylIM0H24Z2kfcCccdmyDqf79lcGhVlhszBsZpZSgymuYDN18mm+8pHQ4mOZKJKa5a8dWpa8SE7JfZ9tCmOzU7D5hR5uosGTPGhvyDDEn8sN4nWvyGrcNcHPCMD7r6ZwpUVD4bC404eGIIPWSUcA9nTtOxEzMEAvG0xhwtN5HuzNPYuklpyeUsn40R/H9qFJ7fkbWtu/olaG50gbDQoSi/m86fwiCIcUpX1QatTvvSeRQVKWRVMrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AylQSco4GfvQKJ9mzjBoOsZepETh6g3GY5IHvMDaDeM=;
 b=RiTYgGLaCeVhuYA3eqWW9iM+vBDFvJ/cOzJAGr+JyYThlfpg/UdxviVrA7Xg2OQcCueLavt3FqBHIggs+Jk/VcmtaFhqX1809aPU7pFkry6VxRYMZzyHQC3A2FrzrNI69gUKx0dvykFDkBMQZCFx7A/XrpsWKQbQkSUuU8Yy/qbzELX+xVPZij8Hx2MX/s/+EmvoHh6xI8xBE+j15FC0evXmBr9w7kwm7NOTShUABYreFENbyYQ96t3ILmRvAX+sHlaL4oseW9IVT/Sunn9xQeaAahyPrpPMc4lI/mz0bJRKATWlEZxJUWutjhnS4Hu7lxxVVIgwmV25MO3lLYzCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [EXT] [virtio] [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow filters requirements
Thread-Index: AQHZvd/S1zVkOCRsJ0eCMof906XE7a/WpxoAgAABq+CAALrcAIACa+7A
Date: Fri, 4 Aug 2023 07:32:10 +0000
Message-ID:
 <PH0PR12MB54817565746BC301D045B2ACDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <SJ0PR18MB44772855643A6348135CE8F1C30BA@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB5481B38BB328AB72B9144651DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SJ0PR18MB4477D28C8CFED566195BEA7FC30BA@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB4477D28C8CFED566195BEA7FC30BA@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA0PR12MB4351:EE_
x-ms-office365-filtering-correlation-id: 20d2793c-6646-422b-a3d6-08db94bcea4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aorjUSjvEpSivBzzAAs0XEMxxa4bIqs5Vcikz16TBFuPiSM5z/RWGUL1CVfRsME2qawsPS/PDcSQUdULfYMrHA+zWv0fxHKvYDBwXQyVOpcVRIxibdeFaZzjZdAkrxkI+xL1nTjLXaj8S02w6QFCS81beKct9dnCgXHeKG9Eh+SRRiDuCzUcTB4S7C5mNzeLeDncvdg7ovdrmRC2LKHtZPS7JbguWq3hXx5WRDGqqq7kLLSf8a60Ch17D3vmO4DidaS9AmEqMmXsNS8sEwR9RYYu9V2JLDw9BEn7U7z+KRht0eX+rRopFxNuydJZeRzN5zNGUJa0Gka73TWjCJTDBhcZsaADUBOmjrTSlMBMDxuyVCedFkFDfKV53okn74f84kDrOzOsqq7V2Ar2AJmEuIB6N252KWNz08AsOmPDZQWOVGV/ByMAq3WeVY25iy0eBXBPDkfleiL1172Vg0EJj8iudlE8HvZGUkX1Dnx07taNNFAwGSvEiCZwaY3ox0MKD3DIKgAodaDqLjwkIedCIaJRKi/3P3IYf6BAPf+bWOi7nG/9RXegTYWrRhG0e0FjESpFTanJhQXJPCY5V7GjY5M3028JMrK+rOpuWUx4EiFdDOlTuQP2GxbOG+EbQq3m
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(1800799003)(186006)(38070700005)(33656002)(86362001)(110136005)(54906003)(478600001)(55016003)(38100700002)(122000001)(83380400001)(6506007)(26005)(41300700001)(8936002)(8676002)(9686003)(7696005)(52536014)(4326008)(71200400001)(66476007)(4744005)(66556008)(66446008)(316002)(64756008)(5660300002)(66946007)(2906002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DVS8h/m15S0m+v8sNlmfxDuBY5bz13mP8RVigiewtuouQkPVAOg51Qy5I/PF?=
 =?us-ascii?Q?XRJOBAmQTBUY8mXDxS8rpsC+mMYPRcttASpx89aM/4I0ptIgYsVhxT46s7iO?=
 =?us-ascii?Q?eE8coa9M/BDSxP9CgA5nyuSJnDXNyoYy6n8TQrIHqDePUMYXhhqk6LadkCoe?=
 =?us-ascii?Q?0ol+bd63QwY69qPdN9FJrUraQuqQLy6r3olVRSPbJKkrBiMVK4cmMHM+IfO7?=
 =?us-ascii?Q?HT/CjkbwGVDUJpLfv9+7iA5nLjG6eKn3rLeJ3H5g0o5odWhzIYzqE6vNyxm7?=
 =?us-ascii?Q?Au/s7zO6P56CyWcO2Z5U5pH4uXj00ocMUSaHEg4qI80c984hAQqANrE5aZ6v?=
 =?us-ascii?Q?bigOXX0sikyq3KZZmN4l5fk1yWqAC1unjGX8gMnfG51B2tyOPr0jXr+KG5O8?=
 =?us-ascii?Q?NrR2+VZlJFhb+g0wUBnyisfPes480H458YJOdY6Ri2fwBwB5afWADJEdWuFt?=
 =?us-ascii?Q?kHKAdQhVNY8W3GqcWtgQg6WpAwEfzpWyeSn2/NtANGPv12qh7XMh7Ezd+a3z?=
 =?us-ascii?Q?ez+sj478vLrXwYgBNPdCq4VqRKbJ6FBAYZW83FcnvgujTOmqDaJShMBVpb0V?=
 =?us-ascii?Q?gpuWOofr0vchn7cQj5uNlZw2mspyuT3AL+fjvuYnQR/IU3BIjT2zKL7GZVea?=
 =?us-ascii?Q?oM2Ar9JSHDd9kZKOAhBw32yen+qxMpzec3NpS7Zsb2/jgtMMExRuDBRlD0EX?=
 =?us-ascii?Q?yt95SZZxf305gYLxJ7HpBM1E30fBx3Hs4OqEMdShBXI3zUMV2GkpB0db5Txe?=
 =?us-ascii?Q?oVFXcqdKq+TBZBeBI/7ILkTE389ODL6bBS+K3AJNWGgViZSlPQQ+6O9nQ3SW?=
 =?us-ascii?Q?0pEmyY4Gq1v0kEv1/47PK0a+mI5+BBalFKyfqBs5wSJLdivisuImo+b7nO8M?=
 =?us-ascii?Q?iZR+k7ZfCX5mpB1XMDyNjPfRj1f2q55IcllwcF9vjVCzlD6HDMCc+bWyN46r?=
 =?us-ascii?Q?OjKguYiZPreKai7uQea4tKaYSlcFs292BUH+fiyqWQATbNOzAMc92KWaycDe?=
 =?us-ascii?Q?ZybEehQpI0kvehatkYzmqOkHpwh24DadsEYt7daQa8fDJok2Mj2PslG2sBHl?=
 =?us-ascii?Q?2f3UiI/M75thW9kjYQ4FV/ZIIH76ArBf6bKQJ4QO7R/EUMlqi+bjB0KNyI7K?=
 =?us-ascii?Q?Gu3+Q11WQ9ceoyYMYbCwk9Vrzj1Iijv91TSCwcI8/MbpCC5Yblm/hqlGw8Hl?=
 =?us-ascii?Q?SuFgszcZ/XGgozFk+bFksQUu19/jVRqLnROoSBkR9hisnpwNMq5I39d1tw+u?=
 =?us-ascii?Q?omKMIrY3vbF6M7PugxbvFHbDAAwK8Pk0xkVlM8ZLFbxYyA/F2lYAPamsw4rH?=
 =?us-ascii?Q?U/leI6W2fTv9Rj0etEZTR7xOUFO1D8hRNg1Tl62im/xHm18gE2xiNuylfcf0?=
 =?us-ascii?Q?QRjK6n5n/FVDo46qEb22+ASyvQxRo52Sj2imMS++17ShxeSSZNDaQaAdb0Wd?=
 =?us-ascii?Q?oY42Nu382YE2eRqoNnBWuW/XDhoeL3TpJ27ANfiG7kPfR8RF8ffZK97aMSu9?=
 =?us-ascii?Q?qn1tYXzXuxZZMw0I8ZNa3gDDBsNP3DjcDsqq5LGexMKzfQ7xot8ZMMr+VivS?=
 =?us-ascii?Q?DmoX6gnw8GxBBieZJzI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d2793c-6646-422b-a3d6-08db94bcea4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 07:32:10.8089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: STUti2ob0tvcElrdPDA3shryJesk75ox8suPA4LqfnUaQHE00q6NHfb68vv56R7qvn/EYE2Pm+RZBjhEXan9YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4351
Subject: [virtio-comment] RE: [EXT] [virtio] [PATCH requirements 5/7] net-features: Add n-tuple
 receive flow filters requirements



> From: Satananda Burla <sburla@marvell.com>
> Sent: Thursday, August 3, 2023 12:02 AM


> Ok. I was proposing that everybody agrees to use index value in 0-n per g=
roup. I
> am fine with the size limitation described below.
Yes, n is configurable and value picked by driver so, things will work with=
 LM flow.

I missed to reply yday...

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

