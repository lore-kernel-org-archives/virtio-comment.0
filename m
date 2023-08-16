Return-Path: <virtio-comment-return-7179-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3589BC04FE1
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 11:18:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8488E77F9
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 11:18:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 54BD298640D
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 11:18:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3C4169863D7; Wed, 16 Aug 2023 11:18:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A1699863D8;
	Wed, 16 Aug 2023 11:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8p5pz5buy8N4tZIRr9dy6ep4U80GJ1VytZNMR6hjH3CTVI0RWH9djQF2Y9h76zATE2d5AD+faBA3f2pX2X2N4AKyx4UC5XZkpItzXexmWuZQ4JsiPSDYtQFl6LmOwBIoXKVr6jT3mHDz+Sqrajt7a+24OpE7utoXcDxEwBG7kMDTiwy06kOBQozjjb8OOcR8FHm/uAm9FQ2vGhe92BbzOLOAALPr+UhBEvLXqO69ZwesU1WtgVVw3as6F8RKyh/CVoYJv+Zm+jJwBDcpDUisJFni18qWo9mMTXskE3VSVXXmjwXw8VZChT9uqBB4Y0N4Fq5GFcLf1OQSZtlXXzOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6e30nr4fGRu72N4s1GlgohU4oR/ezF4AIZSPDU7GwU=;
 b=g5pZmGxOS6pmT+v3/3N776SlRwwB5gdMITqI3NYZpT+aSXDsBo68V/hcU8T58uqXlQ6+jHhYin2RjWdncP/uHhK3uE/l5RqlQl3I/8JI1WDVzSjX5zSppZe3FgNADcnX7yHld2+7Kg9HeccResf2oRSWIxPOECHFb/H2JmwNxEYhk5AdaYhuHhS0vFUeMzstqSwet+ku2Vs3sQPgaoIgR8J3wrT/pHIhaktmtEdqCzIlqQ9lGGaZhLPMgp0p+ryt66Ab5s4KYatlvisT2w32GkZhIble3TxAI/CYNY6DwpALDxgUoP92F+jrOVpO3jxGNfcEiYW/sIzBjg0zfSxifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "david.edmondson@oracle.com"
	<david.edmondson@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "sburla@marvell.com" <sburla@marvell.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>
Thread-Topic: [PATCH requirements v4 5/7] net-features: Add n-tuple receive
 flow filters requirements
Thread-Index: AQHZz0ybAp2BVBRKNECVQ04dzfRGH6/sdGHwgAAWTgCAAC4CkIAADT4AgAACCoA=
Date: Wed, 16 Aug 2023 11:18:33 +0000
Message-ID:
 <PH0PR12MB548107DD272009B9D772E81FDC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-6-parav@nvidia.com>
 <PH0PR12MB54819624183D0A74599C14A1DC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d8502ab9-69f2-4e7b-a013-94caf1c5b6b1@linux.alibaba.com>
 <PH0PR12MB5481F06EC56F02837B515F83DC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9bb0ef99-9a38-4db8-8027-a35634eb6b02@linux.alibaba.com>
In-Reply-To: <9bb0ef99-9a38-4db8-8027-a35634eb6b02@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|LV8PR12MB9155:EE_
x-ms-office365-filtering-correlation-id: ffaef579-dbc6-4034-295d-08db9e4a8772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ul+DTxkR53IETisUf+316hX6a2gwYOz3pXxYlCaoy45DfWoGn+CnDtD/PYVbV4V3MJee6O7td1Jvv13owEQoxEEl0QU2b2Lw11XhYToGDlujFklnUr6PafUqX+VGkKCsNayeX/Wh8c0yp0UqMD//9wAodZ2AmC3clTrG6FFbG6br9JRyj/iL9n95NcbKVR71xsQhGormIfN/mwr0if87m50v60sjN2cR0Bo+s6dqOQ5RmMDzImDg6FU5aQjoUIo3JzqBP2aDOlpcz5BVN+0EvqUWmmjARTlDf99gRgm3Wowl/cqHHaggzGiyV6i+OdApokjwvsH/mx3G1qEu0PEuZoEtjhjvtidccAqdX6y8ALIC+sGyJ+4McwdaLhieSwAKJKOYTUqX0bc9+2s2YS1G7WPXjjez7r3+TpXMvbhv50HrvcgY1iTUKwXeXK6r5I/0l1xXwAM8E/UpIevjYr6n694Qora9AKyPVqHyZAXnkFbku91cb3n5qog15u7nVrm7ECxd8xsmtiTID3npsdf6P8pKVVzqUXOyxurIGlQZ+a7hG70lyTMhhBiv9j/EowTLsY9JNPlE/OZlxDDI0QTpl+Rk20UohyKlNRBnuCBUvHC/rpTQduKOHtHcajrJRzga
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(1800799009)(451199024)(186009)(316002)(54906003)(76116006)(66946007)(110136005)(64756008)(66446008)(66476007)(66556008)(122000001)(41300700001)(52536014)(5660300002)(38070700005)(38100700002)(8676002)(4326008)(8936002)(2906002)(4744005)(83380400001)(26005)(55016003)(478600001)(86362001)(9686003)(33656002)(7696005)(6506007)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEcwSTBja0FjNmpKRVlFUS9kMXZiN1plRjlFcjBxK05Na1hEbHlIK0RPTE9h?=
 =?utf-8?B?NWFMdmdZZ3BJVWpRbWJDVllvYjJlRXI4bjFPUXh6SFM4UWtZOXZYT1R3VExy?=
 =?utf-8?B?bUNBTEdaZWEydFN0ZTQ1NVQ4TWQxMTFwSWJVYWJmNGdWbnZYbGNBT1hIZ1dl?=
 =?utf-8?B?ZERtNzZLR1hLbjFoQzZXQWc1bDFMa3NZMGlaU0ozRTlwNFAyV1l3eUNKdTgw?=
 =?utf-8?B?OFVqSkhpK0o4YmQ4ejRRcG85dnVlcUVpYVVQK2UrR3g5YU85T3NxSVJNUHhi?=
 =?utf-8?B?UjVwK29kNWlSVE83aXRRb2NlRnNOcWhVaFVpL3ROU1orejVZaTYxT3FpSzB5?=
 =?utf-8?B?YVZBa1Y1Z2JsMXovYytuSFBYN3FSVjZhVzVHL01vMzAyZHNldkFFK29pem9L?=
 =?utf-8?B?K1ZyQllkRGJ6RW5RcTc3eGhMdWJZVDYwOUpsVCtVK29QWmJ6Tm5yZDFVdzNn?=
 =?utf-8?B?bGxJVDFDaUQvbHJRS3RXTklnNHhKSEpPZkY5bjFFVmlTaXZmSjRrSjFQV08w?=
 =?utf-8?B?TzVpUUpNYXRRMHBMYUoyN3NjVUFzRzZJMC9PNzlZcnZqZ256MVJUalAwZUI0?=
 =?utf-8?B?azdpeG5qd3hReHZBN1lDY3VWTzFkWjVvOTl0eGpVZXQ5cmJHbWR2TE9tTkFk?=
 =?utf-8?B?R01RelJuMFVUUlE4S3hpajFiZGVNZzFOTmtja05kNWNXcURnUlNtWU5zNXNl?=
 =?utf-8?B?anJhVEdwblNBaXBHS2M3QVhzS2dpWWJJYWxlQnlXN09GVlFBUnVIWmdjRElD?=
 =?utf-8?B?NEZGZG01UWJTK1ZiODdhNkRhM0NGQkVXRVpjdmJyUCtpZmM0RFZFRVJZY0hC?=
 =?utf-8?B?UGJRaDdWenB2YjMvRTVqVW1TVmRaQ0kyU1g0V2JIaTEwWTVwd0h4aDRuMjlE?=
 =?utf-8?B?YjU1MkNYT3RrSHRNRGIxV2hIUHhWVnNjd3pYNXp2RGZVSW9HUWNpdTFJblB1?=
 =?utf-8?B?R2Z3Vms2YzhlM0FDL1ZSZzVqMUo4bWdsV095UVZ2bVdKZjlpczJPRUxXL3Za?=
 =?utf-8?B?Q01BUWd3TU0wcDFuczNpUTdXaFZ4MzhkRUo3QnNPam1zZUV3MkpOV2ZmVkk4?=
 =?utf-8?B?cmRRSVBvVEpGM1AzQmxkWDlsdm5FbCszMkhEbDA4RkN4YlhzbDhoMEFmRDdF?=
 =?utf-8?B?U1hxQzNVeUtLL3hBYk1HZkpNaFRCRkFhNTd1UUppb1RVenlRNEJTRDRhTzZI?=
 =?utf-8?B?MzZsRlI2bWdYZjVGeEQ5TXU1ZldMUWVRS3hUZjBSZE0xRGRHeFQ2TG1nVzlq?=
 =?utf-8?B?NTFTbVQ3QVgyMWNQUmU3REh5bStqcWJ1UUNBelVsbTNjbjBaUGJTQkZqYlhh?=
 =?utf-8?B?ZjNEdm5McTlCNDNwbGoxemd3YldaWFo2MGNYbEVWM3ZqWHA0TTRFRHpKSVBC?=
 =?utf-8?B?dDR2OGJ6SzNpVHhRSHpPdlJlS1ZQRDNJS1YranlOMitIM2t2dFMybGhObUZE?=
 =?utf-8?B?MzE5c3I3NkxxdUVwYTh2NnZ1NUpGd05TMjZOUXZCV0RscTlDVnhKYjl6ekxw?=
 =?utf-8?B?T0VnK1hPL3d3dGt4YjI5TzF0SjRlcTRkbVlXN05RMk1qdWlCc3p0YXc4aFZL?=
 =?utf-8?B?MjhwbnpRUEdPTnJlNU4zVjRrUzVHOTRMOXlpUENUZ1laT2Y0RmNMTkxlcVdU?=
 =?utf-8?B?YkNsQVhzaWRyVEVLcStyYmozdmxmRERyaGNCMXhmUUk1MFVjcnA0RXB3bDVa?=
 =?utf-8?B?TW1UbndtWHZxRUZkVWJsaitzU1hDWWJ3bXdoaE04QXdEdC8vcDFXQUJHK2U1?=
 =?utf-8?B?cWdScFRyNnJPL0RsakdETDdMU3lYUUNzNDNyTW44dnF6ZEl6a2FlVEdMd0hW?=
 =?utf-8?B?ZmlvaCsvbXYrOTFsN3RIdXNnRVd3Z0toTXllSEw0UzZBT0dRbkg3eWM5aWpL?=
 =?utf-8?B?M3ZSNm5VNWE3Z2UrWWVIOXNPa2NwODEwd0VoVE0vTFloRFlQR25ZU082b3lW?=
 =?utf-8?B?MmRMYjlkRWVIME56amY1NktUeVhoWTVleVc4a2lmaGVqcjJ6MlhhczVlSDlI?=
 =?utf-8?B?cFNuSDgwYUNqZWtBYWxEZlVZazNnRlR2VENwWXF1d0VjM2R1dUt3WDZwaytX?=
 =?utf-8?B?Zmc4ZlVZZTAxby9tL0s0dVM1bThkQzBNbDlkK2FrT2Jvb0g3RmhrNytPS2VN?=
 =?utf-8?Q?jlBk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffaef579-dbc6-4034-295d-08db9e4a8772
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 11:18:34.0055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8jVaKh6O6C2z9sNV6Q6+bKMNXfUv+Cg/hO0tunQU+Wd2dGtD5ZrulAKma6I+ta6L7bmul2nn7tduicqn7DDxcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9155
Subject: [virtio-comment] RE: [PATCH requirements v4 5/7] net-features: Add n-tuple receive
 flow filters requirements

DQo+IEZyb206IEhlbmcgUWkgPGhlbmdxaUBsaW51eC5hbGliYWJhLmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCBBdWd1c3QgMTYsIDIwMjMgNDo0MSBQTQ0KDQoNCj4gPiBPbmUgb3B0aW9uIGlzIHRv
IGZvbGxvdyB0aGUgYWJvdmUgd29ya2Fyb3VuZC4NCj4gPiBTZWNvbmQgb3B0aW9uIGlzIHRvIGFk
ZCBmZWF0dXJlIGJpdCB0byBmZWF0dXJlIGJpdCB0byBpbmRpY2F0ZSBkeW5hbWljIFENCj4gY3Jl
YXRpb24uDQo+IA0KPiBJJ20gbGVhbmluZyB0b3dhcmRzIHRoZSBzZWNvbmQgb3B0aW9uLCB3aGlj
aCBtYWtlcyB0aGUgd29yayBvcnRob2dvbmFsIGFuZA0KPiBhbHNvIHdvcmtzIGluIHRoZSBjYXNl
IG9mIFhEUC4NCg0KWWVzLiBsZXRzIGFkZCB0aGUgYml0LiBJIHdpbGwgc2VuZCBwYXRjaCBhcyBw
YXJ0IG9mIHRoaXMgd29yay4NCg==

